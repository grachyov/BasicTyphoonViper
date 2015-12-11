@import Foundation;
@class IGUserModel;

NS_ASSUME_NONNULL_BEGIN

@protocol SearchedUsersStore<NSObject>

- (void)saveUser:(IGUserModel *)user;
- (NSArray<IGUserModel *> *)loadUsers;

@end

NS_ASSUME_NONNULL_END
