#import "PhotosFeedModuleBuilder.h"
#import "CoreServicesConfiguration.h"
#import "DefaultPhotosFeedInteractor.h"
#import "DefaultPhotosFeedPresenter.h"
#import "PhotosFeedViewController.h"
#import "DefaultPhotosFeedViewModelBuilder.h"
#import "PhotoDetailsModuleBuilder.h"
#import "DefaultPhotosFeedWireframe.h"

@implementation PhotosFeedModuleBuilder

- (UIViewController *)photosFeedViewWithUserID:(NSString *)userID {
    return [TyphoonDefinition withClass:[PhotosFeedViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self photosFeedPresenterWithUserID:userID]];
    }];
}

- (id<PhotosFeedPresenter>)photosFeedPresenterWithUserID:(NSString *)userID {
    return [TyphoonDefinition withClass:[DefaultPhotosFeedPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithInteractor:viewModelBuilder:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self photosFeedInteractorWithUserID:userID]];
            [initializer injectParameterWith:[self photosFeedViewModelBuilder]];
        }];
    
        [definition injectProperty:@selector(view) with:[self photosFeedViewWithUserID:userID]];
        [definition injectProperty:@selector(wireframe) with:[self photosFeedWireframeWithUserID:userID]];
    }];
}

- (id<PhotosFeedInteractor>)photosFeedInteractorWithUserID:(NSString *)userID {
    return [TyphoonDefinition withClass:[DefaultPhotosFeedInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithInstagramService:feedStore:userID:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self.coreServices instagramService]];
            [initializer injectParameterWith:[self.coreServices instagramDataStore]];
            [initializer injectParameterWith:userID];
        }];
    }];
}

- (id<PhotosFeedWireframe>)photosFeedWireframeWithUserID:(NSString *)userID {
    return [TyphoonDefinition withClass:[DefaultPhotosFeedWireframe class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithPhotoDetailsModuleBuilder:) parameters:^(TyphoonMethod *initializer) { 
            [initializer injectParameterWith:self.photoDetailsModuleBuilder];
        }];
        [definition injectProperty:@selector(viewController) with:[self photosFeedViewWithUserID:userID]];
    }];
}

- (id<PhotosFeedViewModelBuilder>)photosFeedViewModelBuilder {
    return [TyphoonDefinition withClass:[DefaultPhotosFeedViewModelBuilder class]];
}

@end
