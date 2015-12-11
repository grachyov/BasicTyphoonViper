@import UIKit;
@class UserViewModel;

@interface SuggestionsViewController : UITableViewController

@property (nonatomic, copy) void (^didSelectSugestionHandler)(UserViewModel *);
@property (nonatomic, copy) NSArray<UserViewModel *> *suggestions;

@end
