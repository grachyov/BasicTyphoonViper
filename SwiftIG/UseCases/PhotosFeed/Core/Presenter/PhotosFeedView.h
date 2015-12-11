@import Foundation;
@class PhotosFeedItemViewModel;
@class ErrorViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol PhotosFeedView<NSObject>

- (void)showPhotos:(NSArray<PhotosFeedItemViewModel *> *)photos;
- (void)showError:(ErrorViewModel *)error;

@end

NS_ASSUME_NONNULL_END
