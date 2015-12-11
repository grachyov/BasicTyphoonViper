#import <UIView-Autolayout/UIView+AutoLayout.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "PhotosFeedCell.h"

@interface PhotosFeedCell ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@end

@implementation PhotosFeedCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self == nil) {
        return nil;
    }
    
    _imageView = [[UIImageView alloc] init];
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:_imageView];
    
    [_imageView pinToSuperviewEdgesWithInset:UIEdgeInsetsZero];
    self.imageView.backgroundColor = [UIColor grayColor];
    return self;
}

- (void)setImageUrl:(NSURL *)url {
    if (self.showsActivityIndicator) {
        [self.activityIndicator startAnimating];
    }
    
    __weak typeof(self) wSelf = self;
    [self.imageView sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [wSelf.activityIndicator stopAnimating];
    }];
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    layoutAttributes.size = CGSizeMake(layoutAttributes.size.width, layoutAttributes.size.width);
    return layoutAttributes;
}

#pragma mark - Private

- (UIActivityIndicatorView *)activityIndicator {
    if (_activityIndicator == nil) {
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activityIndicator.translatesAutoresizingMaskIntoConstraints = NO;
        [self.imageView addSubview:_activityIndicator];
        [_activityIndicator centerInContainer];
    }
    return _activityIndicator;
}

@end
