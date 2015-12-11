@import Foundation;
@class PhotoDetailsViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol PhotoDetailsView<NSObject>

- (void)showPhotoDetails:(PhotoDetailsViewModel *)photoDetails;

@end

NS_ASSUME_NONNULL_END