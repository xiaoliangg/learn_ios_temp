//
//  APLRecentSearchesController.h
//  ToolbarSearch_mine
//
//  Created by yl on 2022/2/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *RecentSearchesKey;

@class APLRecentSearchesController;

@protocol RecentSearchesDelegate
// sent when the user selects a row in the recent searches list
- (void)recentSearchesController:(APLRecentSearchesController *)controller didSelectString:(NSString *)searchString;
@end



@interface APLRecentSearchesController : UITableViewController <UIActionSheetDelegate>


@property (nonatomic, weak) id <RecentSearchesDelegate> delegate;

@property (nonatomic, readonly) UIActionSheet *confirmSheet;

- (void)filterResultsUsingString:(NSString *)filterString;
- (void)addToRecentSearches:(NSString *)searchString;

@end

NS_ASSUME_NONNULL_END
