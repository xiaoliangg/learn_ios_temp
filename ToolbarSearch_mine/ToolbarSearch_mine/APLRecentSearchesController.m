//
//  APLRecentSearchesController.m
//  ToolbarSearch_mine
//
//  Created by yl on 2022/2/28.
//

#import "APLRecentSearchesController.h"

NSString *RecentSearchesKey = @"RecentSearchesKey";

@interface APLRecentSearchesController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *clearButtonItem;

// 搜索历史
@property (nonatomic) NSArray *recentSearches;
// 过滤后展示的搜索历史
@property (nonatomic) NSArray *displayedRecentSearches;
@property (nonatomic, readwrite) UIActionSheet *confirmSheet;

@end
#pragma mark -

@implementation APLRecentSearchesController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    NSLog(@"%@",NSStringFromSelector(_cmd));

    [super viewDidLoad];

    // Set up the recent searches list, from user defaults or using an empty array.
    NSArray *recents = [[NSUserDefaults standardUserDefaults] objectForKey:RecentSearchesKey];
    if (recents) {
        self.recentSearches = recents;
        self.displayedRecentSearches = recents;
    }
    else {
        self.recentSearches = [NSArray array];
        self.displayedRecentSearches = [NSArray array];
    }

    // Disable the Clear button if there are no recents items.
    if ([self.recentSearches count] == 0) {
        self.clearButtonItem.enabled = NO;
    }
}


- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%@",NSStringFromSelector(_cmd));

    // Ensure the complete list of recents is shown on first display.
    [super viewWillAppear:animated];
    self.displayedRecentSearches = self.recentSearches;
}


#pragma mark - Managing the recents list
// 将搜索字符串添加到历史记录。搜索完后调用。
// APLToolbarSearchViewController 的 UISearchBarDelegate.searchBarSearchButtonClicked 方法调用
- (void)addToRecentSearches:(NSString *)searchString {
    NSLog(@"%@",NSStringFromSelector(_cmd));

    // Filter out any strings that shouldn't be in the recents list.
    if ([searchString isEqualToString:@""]) {
        return;
    }
    
    // Create a mutable copy of recent searches and remove the search string if it's already there (it's added to the top of the list later).

    NSMutableArray *mutableRecents = [self.recentSearches mutableCopy];
    [mutableRecents removeObject:searchString];
    
    // Add the new string at the top of the list.
    [mutableRecents insertObject:searchString atIndex:0];
    
    // Update user defaults.
    [[NSUserDefaults standardUserDefaults] setObject:mutableRecents forKey:RecentSearchesKey];

    // Set self's recent searches to the new recents array, and reload the table view.
    self.recentSearches = mutableRecents;
    self.displayedRecentSearches = mutableRecents;
    [self.tableView reloadData];
    
    // Ensure the clear button is enabled.
    self.clearButtonItem.enabled = YES;
}

// 在搜索框输入时，每输入一个字符都会调用，用来过滤历史记录
// APLToolbarSearchViewController 的 UISearchBarDelegate.textDidChange 方法调用
- (void)filterResultsUsingString:(NSString *)filterString {
    NSLog(@"%@",NSStringFromSelector(_cmd));

    // If the search string is zero-length, then restore the recent searches, otherwise
    // create a predicate to filter the recent searches using the search string.
    //
    if ([filterString length] == 0) {
        self.displayedRecentSearches = self.recentSearches;
    }
    else {
        NSPredicate *filterPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[cd] %@", filterString];
        NSArray *filteredRecentSearches = [self.recentSearches filteredArrayUsingPredicate:filterPredicate];
        self.displayedRecentSearches = filteredRecentSearches;
    }

    [self.tableView reloadData];
}

// 点击 "clear" 按钮时调用此方法，storyboard中有关联
- (IBAction)showClearRecentsAlert:(id)sender {
    NSLog(@"%@",NSStringFromSelector(_cmd));

    NSString *cancelButtonTitle = NSLocalizedString(@"Cancel", @"Cancel button title");
    NSString *clearAllRecentsButtonTitle = NSLocalizedString(@"Clear All Recents", @"Clear All Recents button title");
    
    // If the user taps the Clear Recents button, present an action sheet to confirm.
    self.confirmSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:clearAllRecentsButtonTitle otherButtonTitles:nil];
    [self.confirmSheet showInView:self.view];
}

#pragma -mark -UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%@",NSStringFromSelector(_cmd));

    if (buttonIndex == 0) {
        /*
         If the user chose to clear recents, remove the recents entry from user defaults, set the list to an empty array, and redisplay the table view.
         */
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:RecentSearchesKey];
        self.recentSearches = [NSArray array];
        self.displayedRecentSearches = [NSArray array];
        [self.tableView reloadData];
        self.clearButtonItem.enabled = NO;
    }
    self.confirmSheet = nil;
}


#pragma mark - Table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%@",NSStringFromSelector(_cmd));

    return [self.displayedRecentSearches count];
}

// Display the strings in displayedRecentSearches.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@",NSStringFromSelector(_cmd));

    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.textLabel.text = [self.displayedRecentSearches objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@",NSStringFromSelector(_cmd));

    // Notify the delegate if a row is selected.
    [self.delegate recentSearchesController:self didSelectString:[self.displayedRecentSearches objectAtIndex:indexPath.row]];
}

@end
