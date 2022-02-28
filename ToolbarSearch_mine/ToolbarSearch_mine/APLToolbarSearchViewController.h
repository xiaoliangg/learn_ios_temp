//
//  APLToolbarSearchViewController.h
//  ToolbarSearch_mine
//
//  Created by yl on 2022/2/28.
//

#import <UIKit/UIKit.h>
#import "APLRecentSearchesController.h"

NS_ASSUME_NONNULL_BEGIN

@interface APLToolbarSearchViewController : UIViewController <UISearchBarDelegate, UIPopoverControllerDelegate, RecentSearchesDelegate>

@end

NS_ASSUME_NONNULL_END
