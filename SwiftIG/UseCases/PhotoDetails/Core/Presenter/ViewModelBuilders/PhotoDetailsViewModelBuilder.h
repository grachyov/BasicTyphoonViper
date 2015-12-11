@import Foundation;
@class PhotoDetailsViewModel;
@class IGFeedItemModel;

NS_ASSUME_NONNULL_BEGIN

@protocol PhotoDetailsViewModelBuilder<NSObject>

- (PhotoDetailsViewModel *)buildPhotoDetailsViewModelFromPhoto:(IGFeedItemModel *)feedItem;

@end

NS_ASSUME_NONNULL_END
