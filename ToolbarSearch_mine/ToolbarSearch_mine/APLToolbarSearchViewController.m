//
//  APLToolbarSearchViewController.m
//  ToolbarSearch_mine
//
//  Created by yl on 2022/2/28.
//

#import "APLToolbarSearchViewController.h"
@interface APLToolbarSearchViewController()


@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@end


@implementation APLToolbarSearchViewController

#pragma mark - RecentSearchesDelegate

- (void)recentSearchesController:(APLRecentSearchesController *)controller didSelectString:(NSString *)searchString {
//    self.searchBar.text = searchString;
//    [self finishSearchWithString:searchString];
}

@end
