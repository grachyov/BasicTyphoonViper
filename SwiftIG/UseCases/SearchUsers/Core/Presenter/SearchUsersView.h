@import Foundation;
@class UserViewModel;
@class ErrorViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol SearchUsersView<NSObject>

- (void)showSuggestions;
- (void)hideSuggestions;

- (void)showSuggestedUsers:(NSArray<UserViewModel *> *)users;
- (void)showError:(ErrorViewModel *)error;
- (void)pushRecentlySearchedUser:(UserViewModel *)user;

@end

NS_ASSUME_NONNULL_END
