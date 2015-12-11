@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@protocol PhotosFeedPresenter<NSObject>

- (void)loadContent;
- (void)loadContentIngoringCache;
- (void)showPhotoDetails:(NSString *)photoID;

@end

NS_ASSUME_NONNULL_END