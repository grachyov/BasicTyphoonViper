@import UIKit;
@protocol PhotosFeedPresenter;
#import "PhotosFeedView.h"

@interface PhotosFeedViewController : UICollectionViewController <PhotosFeedView>

@property (nonatomic, strong) id<PhotosFeedPresenter> presenter;

@end
