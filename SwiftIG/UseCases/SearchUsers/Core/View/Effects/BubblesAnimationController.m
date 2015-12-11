#import "BubblesAnimationController.h"

@interface BubblesAnimationController ()

@property (nonatomic, strong) NSMutableArray<__kindof UIView *> *recentSearchBubbles;
@property (nonatomic, weak) UIView *view;

@end

@implementation BubblesAnimationController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationWillEnterForegroundNotification
                                                  object:nil];
}

- (instancetype)initWithHostedView:(UIView *)view {
    if (self = [super init]) {
        _recentSearchBubbles = [NSMutableArray array];
        _view = view;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(restart)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
    }
    return self;
}

- (void)restart {
    for (UIView *bubble in self.recentSearchBubbles) {
        [self addAnimations:bubble];
    }
}

- (void)addBubble:(UIView *)bubble {
    [self.recentSearchBubbles addObject:bubble];
    CGFloat size = [self randomSize];
    bubble.bounds = CGRectMake(0, 0, size, size);
    [self addAnimations:bubble];
}

- (void)addAnimations:(UIView *)view {
    void (^animations)() = ^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.5 animations:^{
            view.center = [self randomPoint];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
            view.center = [self randomPoint];
        }];
        [UIView addKeyframeWithRelativeStartTime:1 relativeDuration:0.5 animations:^{
            view.center = [self randomPoint];
        }];
    };
    
    UIViewKeyframeAnimationOptions options =
        UIViewKeyframeAnimationOptionBeginFromCurrentState |
        UIViewKeyframeAnimationOptionAutoreverse |
        UIViewKeyframeAnimationOptionRepeat;
    
    [UIView animateKeyframesWithDuration:15.0 delay:0.0 options:options animations:animations completion:nil];
}

- (CGFloat)randomSize {
    NSArray *sizes = @[@70, @100, @50];
    return [sizes[arc4random_uniform((int)sizes.count)] floatValue];
}

- (CGPoint)randomPoint {
    return CGPointMake(arc4random_uniform(CGRectGetWidth(self.view.bounds)),
                       arc4random_uniform(CGRectGetHeight(self.view.bounds)));
}

@end
