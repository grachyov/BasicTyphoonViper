@import UIKit;

@interface PhotosFeedCell : UICollectionViewCell

@property (nonatomic, assign) BOOL showsActivityIndicator;

- (void)setImageUrl:(NSURL *)url;

@end
