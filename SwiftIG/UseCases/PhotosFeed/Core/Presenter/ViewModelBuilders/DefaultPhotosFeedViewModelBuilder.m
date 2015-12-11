#import "DefaultPhotosFeedViewModelBuilder.h"
#import "PhotosFeedItemViewModel.h"
#import "IGFeedItemModel.h"
#import "NSArray+SGAdditions.h"
#import "ErrorViewModel.h"

@implementation DefaultPhotosFeedViewModelBuilder

- (NSArray<PhotosFeedItemViewModel *> *)buildPhotosFeedFromPhotos:(NSArray<IGFeedItemModel *> *)photos {
    return [photos sg_map:^id(IGFeedItemModel *feedItem) {
        PhotosFeedItemViewModel *photo = [[PhotosFeedItemViewModel alloc] init];
        photo.url = feedItem.thumbnailImage;
        photo.ID = feedItem.ID;
        return photo;
    }];
}

- (ErrorViewModel *)buildPhotosFeedError:(NSError *)error {
    ErrorViewModel *vm = [[ErrorViewModel alloc] init];
    vm.title = NSLocalizedString(@"Whoops", nil);
    vm.text = NSLocalizedString(@"Something went wrong!", nil);
    return vm;
}

@end