@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface BubblesAnimationController : NSObject

- (instancetype)initWithHostedView:(UIView *)view;

- (void)restart;
- (void)addBubble:(UIView *)bubble;

@end

NS_ASSUME_NONNULL_END
