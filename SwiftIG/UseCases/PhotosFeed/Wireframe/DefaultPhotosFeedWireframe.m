#import "DefaultPhotosFeedWireframe.h"
#import "PhotoDetailsModuleBuilder.h"

@interface DefaultPhotosFeedWireframe ()

@property (nonatomic, strong) PhotoDetailsModuleBuilder *photoDetailsModuleBuilder;

@end

@implementation DefaultPhotosFeedWireframe

- (instancetype)initWithPhotoDetailsModuleBuilder:(PhotoDetailsModuleBuilder *)photoDetailsModuleBuilder {
    if (self = [super init]) {
       _photoDetailsModuleBuilder = photoDetailsModuleBuilder;
    }
    return self;
}

#pragma mark - <PhotosFeedWireframe>

- (void)showPhotoDetails:(NSString *)photoID {
    UIViewController *photoVC = [self.photoDetailsModuleBuilder photoDetailsViewWithPhotoID:photoID];
    [self.viewController.navigationController pushViewController:photoVC animated:YES];
}

@end