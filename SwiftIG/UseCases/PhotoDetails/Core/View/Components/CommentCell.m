#import <UIView-Autolayout/UIView+AutoLayout.h>
#import "CommentCell.h"

@implementation CommentCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self == nil) {
        return nil;
    }
    
    _label = [[UILabel alloc] init];
    _label.translatesAutoresizingMaskIntoConstraints = NO;
    _label.numberOfLines = 0;
    
    [self.contentView addSubview:_label];
    
    [_label pinToSuperviewEdgesWithInset:UIEdgeInsetsMake(5, 5, 0, 5)];
    
    return self;
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    layoutAttributes.size = [self systemLayoutSizeFittingSize:layoutAttributes.size 
                                withHorizontalFittingPriority:UILayoutPriorityRequired 
                                      verticalFittingPriority:UILayoutPriorityFittingSizeLevel];
    return layoutAttributes;
}

@end