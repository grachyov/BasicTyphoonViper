@import UIKit;
#import "SearchUsersView.h"
@protocol SearchUsersPresenter;

@interface SearchUsersViewController : UIViewController <SearchUsersView>

@property (nonatomic, strong) id<SearchUsersPresenter> presenter;

@end

