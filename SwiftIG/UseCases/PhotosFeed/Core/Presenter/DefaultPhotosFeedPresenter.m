#import "DefaultPhotosFeedPresenter.h"
#import "PhotosFeedInteractor.h"
#import "PhotosFeedView.h"
#import "PhotosFeedViewModelBuilder.h"
#import "PhotosFeedWireframe.h"

@interface DefaultPhotosFeedPresenter ()

@property (nonatomic, strong) id<PhotosFeedInteractor> interactor;
@property (nonatomic, strong) id<PhotosFeedViewModelBuilder> viewModelBuilder;

@end


@implementation DefaultPhotosFeedPresenter

- (instancetype)initWithInteractor:(id<PhotosFeedInteractor>)interactor 
                  viewModelBuilder:(id<PhotosFeedViewModelBuilder>)viewModelBuilder {
    if (self = [super init]) {
        _interactor = interactor;
        _viewModelBuilder = viewModelBuilder;
    }
    return self;
}

#pragma mark - <PhotosFeedPresenter>

- (void)loadContent {
    [self fetchPhotosFeedIgnoringCache:NO];
}

- (void)loadContentIngoringCache {
    [self fetchPhotosFeedIgnoringCache:YES];
}

- (void)showPhotoDetails:(NSString *)photoID {
    [self.wireframe showPhotoDetails:photoID];
}

#pragma mark - Private

- (void)fetchPhotosFeedIgnoringCache:(BOOL)ignoreCache {
    __weak typeof(self) wSelf = self;
    
    id completionHandler = ^(NSArray *photos, NSError *error) {
        __strong typeof(self) sSelf = wSelf;
        
        if (error) {
            [sSelf.view showError:[sSelf.viewModelBuilder buildPhotosFeedError:error]];
        } else {
            [sSelf.view showPhotos:[sSelf.viewModelBuilder buildPhotosFeedFromPhotos:photos]];
        }
    };

    [self.interactor fetchPhotosFeedAllowingCachedResponse:!ignoreCache completion:completionHandler];
}

@end
