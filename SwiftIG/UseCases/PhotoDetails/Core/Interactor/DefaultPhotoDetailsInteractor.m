#import "DefaultPhotoDetailsInteractor.h"
#import "InstagramDataStore.h"

@interface DefaultPhotoDetailsInteractor ()

@property (nonatomic, strong) id<InstagramDataStore> photosStore;

@end

@implementation DefaultPhotoDetailsInteractor

- (instancetype)initWithPhotosStore:(id<InstagramDataStore>)photosStore {
    if (self = [super init]) {
        _photosStore = photosStore;
    }
    return self;
}

- (IGFeedItemModel *)photoWithID:(NSString *)ID {
    return [self.photosStore feedItemWithID:ID];
}

@end