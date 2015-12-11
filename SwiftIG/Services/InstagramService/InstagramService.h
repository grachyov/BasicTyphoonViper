@import Foundation;
@class IGFeedItemModel;
@class IGUserModel;

NS_ASSUME_NONNULL_BEGIN

@protocol InstagramService<NSObject>

- (void)findUser:(NSString *)query completion:(void (^)(NSArray<IGUserModel *> * _Nullable users, NSError * _Nullable error))completion;
- (void)fetchUserFeed:(NSString *)userID completion:(void (^)(NSArray<IGFeedItemModel *> * _Nullable feed, NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
