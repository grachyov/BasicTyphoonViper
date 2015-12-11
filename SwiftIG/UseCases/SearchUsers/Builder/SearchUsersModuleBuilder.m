#import "SearchUsersModuleBuilder.h"
#import "SearchUsersViewController.h"
#import "PhotosFeedModuleBuilder.h"
#import "DefaultSearchUsersInteractor.h"
#import "DefaultSearchUsersPresenter.h"
#import "CoreServicesConfiguration.h"
#import "DefaultSearchUsersViewModelBuilder.h"
#import "DefaultSearchUsersWireframe.h"
#import "PersistentUsersStore.h"

@implementation SearchUsersModuleBuilder

- (UIViewController *)searchUsersView {
    return [TyphoonDefinition withClass:[SearchUsersViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self searchUsersPresenter]];
    }];
}

- (id<SearchUsersPresenter>)searchUsersPresenter {
    return [TyphoonDefinition withClass:[DefaultSearchUsersPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithInteractor:viewModelBuilder:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self searchUsersInteractor]];
            [initializer injectParameterWith:[self searchUsersViewModelBuilder]];
        }];
        [definition injectProperty:@selector(view) with:[self searchUsersView]];
        [definition injectProperty:@selector(wireframe) with:[self searchUsersWireframe]];
    }];
}

- (id<SearchUsersInteractor>)searchUsersInteractor {
    return [TyphoonDefinition withClass:[DefaultSearchUsersInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithInstagramService:usersStore:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self.coreServices instagramService]];
            [initializer injectParameterWith:[self usersStore]];
        }];
    }];
}

- (id<SearchUsersViewModelBuilder>)searchUsersViewModelBuilder {
    return [TyphoonDefinition withClass:[DefaultSearchUsersViewModelBuilder class]];
}

- (id<SearchUsersWireframe>)searchUsersWireframe {
    return [TyphoonDefinition withClass:[DefaultSearchUsersWireframe class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithPhotosFeedModuleBuilder:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:self.photosFeedModuleBuilder];
        }];
        [definition injectProperty:@selector(viewController) with:[self searchUsersView]];
    }];
}

- (id<SearchedUsersStore>)usersStore {
    return [TyphoonDefinition withClass:[PersistentUsersStore class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithUserDefaults:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[NSUserDefaults standardUserDefaults]];
        }];
    }];
}

@end