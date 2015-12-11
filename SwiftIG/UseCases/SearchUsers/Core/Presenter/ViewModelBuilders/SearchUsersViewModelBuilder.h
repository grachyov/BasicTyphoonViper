@import Foundation;
@class IGUserModel;
@class UserViewModel;
@class ErrorViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol SearchUsersViewModelBuilder<NSObject>

- (NSArray<UserViewModel *> *)buildSuggestedUsersFromUsers:(NSArray<IGUserModel *> *)users;
- (ErrorViewModel *)buildSearchUsersError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
