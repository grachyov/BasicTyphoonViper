@import UIKit;
#import "PhotoDetailsView.h"
@protocol PhotoDetailsPresenter;

@interface PhotoDetailsViewController : UICollectionViewController <PhotoDetailsView>

@property (nonatomic, strong) id<PhotoDetailsPresenter> presenter;

@end
