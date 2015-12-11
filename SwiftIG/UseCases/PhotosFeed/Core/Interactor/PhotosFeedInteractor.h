@import Foundation;
@class IGFeedItemModel;

@protocol PhotosFeedInteractor<NSObject>

- (void)fetchPhotosFeedAllowingCachedResponse:(BOOL)cacheAllowed
                                   completion:(void (^)(NSArray<IGFeedItemModel *> *photos, NSError *error))completion;
@end