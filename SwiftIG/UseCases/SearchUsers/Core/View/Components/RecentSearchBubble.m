#import <SDWebImage/UIImageView+WebCache.h>
#import <UIView-AutoLayout/UIView+AutoLayout.h>
#import "RecentSearchBubble.h"
#import "UserViewModel.h"

@interface RecentSearchBubble ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation RecentSearchBubble

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView.layer.masksToBounds = YES;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        
        _imageView = [[UIImageView alloc] init];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_imageView];
        [_imageView pinToSuperviewEdgesWithInset:UIEdgeInsetsMake(2, 2, 2, 2)];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.layer.cornerRadius = CGRectGetWidth(self.imageView.bounds) / 2;
    self.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2;
}

- (void)setViewModel:(UserViewModel *)viewModel {
    [self.imageView sd_setImageWithURL:viewModel.profilePicture];
}

@end