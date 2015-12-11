@import Foundation;
@class IGFeedItemModel;
@class PhotosFeedItemViewModel;
@class ErrorViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol PhotosFeedViewModelBuilder <NSObject>

- (NSArray<PhotosFeedItemViewModel *> *)buildPhotosFeedFromPhotos:(NSArray<IGFeedItemModel *> *)photos;
- (ErrorViewModel *)buildPhotosFeedError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END