@import Foundation;
@class IGUserModel;

NS_ASSUME_NONNULL_BEGIN

@protocol SearchUsersInteractor<NSObject>

- (void)searchForUsers:(NSString *)query
            completion:(void (^)(NSArray<IGUserModel *> * _Nullable users, NSError * _Nullable error))completion;

- (NSArray<IGUserModel *> *)recentlySearchedUsers;
- (void)saveRecentlySearchedUser:(NSString *)userID;

@end

NS_ASSUME_NONNULL_END
