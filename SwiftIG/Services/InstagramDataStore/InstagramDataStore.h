@import Foundation;
@class IGFeedItemModel;

NS_ASSUME_NONNULL_BEGIN

@protocol InstagramDataStore<NSObject>

- (void)storeFeed:(NSArray<IGFeedItemModel *> *)feed forUserID:(NSString *)userID;
- (NSArray<IGFeedItemModel *> *)feedForUserID:(NSString *)userID;
- (IGFeedItemModel *)feedItemWithID:(NSString *)photoID;

@end

NS_ASSUME_NONNULL_END
