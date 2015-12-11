#import "PhotoDetailsModuleBuilder.h"
#import "PhotoDetailsViewController.h"
#import "DefaultPhotoDetailsPresenter.h"
#import "DefaultPhotoDetailsInteractor.h"
#import "CoreServicesConfiguration.h"
#import "DefaultPhotoDetailsViewModelBuilder.h"

@implementation PhotoDetailsModuleBuilder

- (UIViewController *)photoDetailsViewWithPhotoID:(NSString *)photoID {
    return [TyphoonDefinition withClass:[PhotoDetailsViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self photoDetailsPresenterWithPhotoID:photoID]];
    }];
}

- (id<PhotoDetailsPresenter>)photoDetailsPresenterWithPhotoID:(NSString *)photoID {
    return [TyphoonDefinition withClass:[DefaultPhotoDetailsPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithInteractor:viewModelBuilder:photoID:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self photoDetailsInteractor]];
            [initializer injectParameterWith:[self photoDetailsViewModelBuilder]];
            [initializer injectParameterWith:photoID];
        }];
        [definition injectProperty:@selector(view) with:[self photoDetailsViewWithPhotoID:photoID]];
    }];
}

- (id<PhotoDetailsInteractor>)photoDetailsInteractor {
    return [TyphoonDefinition withClass:[DefaultPhotoDetailsInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithPhotosStore:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self.coreServices instagramDataStore]];
        }];
    }];
}

- (id<PhotoDetailsViewModelBuilder>)photoDetailsViewModelBuilder {
    return [TyphoonDefinition withClass:[DefaultPhotoDetailsViewModelBuilder class]];
}

@end