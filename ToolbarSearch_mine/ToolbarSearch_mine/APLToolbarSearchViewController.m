//
//  APLToolbarSearchViewController.m
//  ToolbarSearch_mine
//
//  Created by yl on 2022/2/28.
//

#import "APLToolbarSearchViewController.h"
@interface APLToolbarSearchViewController()

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

@property (nonatomic) APLRecentSearchesController *recentSearchesController;
@property (nonatomic) UIPopoverController *recentSearchesPopoverController;

@end


@implementation APLToolbarSearchViewController

#pragma mark - RecentSearchesDelegate

- (void)recentSearchesController:(APLRecentSearchesController *)controller didSelectString:(NSString *)searchString {
    self.searchbar.text = searchString;
    [self finishSearchWithString:searchString];
}


#pragma mark - UISearchBarDelegate
// 点击搜索框开始编辑时调用
- (void)searchBarTextDidBeginEditing:(UISearchBar *)aSearchBar {
    NSLog(@"%@",NSStringFromSelector(_cmd));

    // Create the popover if it is not already open.
    if (self.recentSearchesPopoverController == nil) {

        // Use the storyboard to instantiate a navigation controller that contains a recent searches controller.
        UINavigationController *navigationController = [[self storyboard] instantiateViewControllerWithIdentifier:@"PopoverNavigationController"];

        self.recentSearchesController = (APLRecentSearchesController *)[navigationController topViewController];
        self.recentSearchesController.delegate = self;
        
        // Create the popover controller to contain the navigation controller.
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:navigationController];
        popover.delegate = self;
        
        // Ensure the popover is not dismissed if the user taps in the search bar by adding
        // the search bar to the popover's list of pass-through views.
        popover.passthroughViews = @[self.searchbar];
        
        self.recentSearchesPopoverController = popover;
    }
    
    // Display the popover.
    [self.recentSearchesPopoverController presentPopoverFromRect:[self.searchbar bounds] inView:self.searchbar permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

// todo
- (void)searchBarTextDidEndEditing:(UISearchBar *)aSearchBar {
    NSLog(@"%@",NSStringFromSelector(_cmd));

    // If the user finishes editing text in the search bar by, for example: tapping away
    // rather than selecting from the recents list, then just dismiss the popover,
    // but only if its confirm UIActionSheet is not open (UIActionSheets can take away
    // first responder from the search bar when first opened).
    //
    if (self.recentSearchesPopoverController != nil) {
        
//        if (self.recentSearchesController.confirmSheet == nil) {
//            [self.recentSearchesPopoverController dismissPopoverAnimated:YES];
//            self.recentSearchesPopoverController = nil;
//        }
    }
    [aSearchBar resignFirstResponder];
}

// 搜索词改变后调用，每次改变都调用
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"%@",NSStringFromSelector(_cmd));

    // When the search string changes, filter the recents list accordingly.
//    [self.recentSearchesController filterResultsUsingString:searchText];
}

// 触发搜索后调用
- (void)searchBarSearchButtonClicked:(UISearchBar *)aSearchBar {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    // When the search button is tapped, add the search term to recents and conduct the search.
    NSString *searchString = [self.searchbar text];
//    [self.recentSearchesController addToRecentSearches:searchString];
    [self finishSearchWithString:searchString];
}

#pragma mark - UIPopoverControllerDelegate
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
    NSLog(@"%@",NSStringFromSelector(_cmd));

    // Remove focus from the search bar without committing the search.
    self.progressLabel.text = NSLocalizedString(@"Canceled a search.", @"canceled search string for the progress label");
    self.recentSearchesPopoverController = nil;
//    [self.searchBar resignFirstResponder];
}


#pragma mark - Finish the search

- (void)finishSearchWithString:(NSString *)searchString {
    
    // Conduct the search. In this case, simply report the search term used.
    [self.recentSearchesPopoverController dismissPopoverAnimated:YES];
    self.recentSearchesPopoverController = nil;
    NSString *formatString = NSLocalizedString(@"Performed a search using \"%@\".", @"format string for reporting search performed");
    self.progressLabel.text = [NSString stringWithFormat:formatString, searchString];
    [self.searchbar resignFirstResponder];
}

@end
