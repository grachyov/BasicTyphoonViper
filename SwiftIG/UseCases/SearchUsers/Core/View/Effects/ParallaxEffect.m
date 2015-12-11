#import "ParallaxEffect.h"

@implementation ParallaxEffect

static const CGFloat ParallaxEffectRelativeValue = 30;

+ (void)attachToView:(UIView *)view {
    UIInterpolatingMotionEffect *verticalMotionEffect = 
        [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    
    verticalMotionEffect.minimumRelativeValue = @(-ParallaxEffectRelativeValue);
    verticalMotionEffect.maximumRelativeValue = @(ParallaxEffectRelativeValue);
    
    UIInterpolatingMotionEffect *horizontalMotionEffect = 
        [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    
    horizontalMotionEffect.minimumRelativeValue = @(-ParallaxEffectRelativeValue);
    horizontalMotionEffect.maximumRelativeValue = @(ParallaxEffectRelativeValue);
    
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
    
    [view addMotionEffect:group];
}

@end