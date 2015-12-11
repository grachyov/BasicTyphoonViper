#import "PhotoDetailsInteractor.h"
#import "InstagramDataStore.h"

@interface DefaultPhotoDetailsInteractor : NSObject <PhotoDetailsInteractor>

- (instancetype)initWithPhotosStore:(id<InstagramDataStore>)photosStore;

@end