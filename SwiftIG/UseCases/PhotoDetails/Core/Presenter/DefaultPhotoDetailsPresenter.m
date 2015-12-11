#import "DefaultPhotoDetailsPresenter.h"
#import "PhotoDetailsInteractor.h"
#import "IGFeedItemModel.h"
#import "PhotoDetailsView.h"
#import "PhotoDetailsViewModelBuilder.h"

@interface DefaultPhotoDetailsPresenter ()

@property (nonatomic, strong) id<PhotoDetailsInteractor> interactor;
@property (nonatomic, strong) id<PhotoDetailsViewModelBuilder> viewModelBuilder;
@property (nonatomic, copy) NSString *photoID;

@end

@implementation DefaultPhotoDetailsPresenter

- (instancetype)initWithInteractor:(id<PhotoDetailsInteractor>)interactor
                  viewModelBuilder:(id<PhotoDetailsViewModelBuilder>)viewModelBuilder
                           photoID:(NSString *)photoID {
    if (self = [super init]) {
        _interactor = interactor;
        _viewModelBuilder = viewModelBuilder;
        _photoID = [photoID copy];
    }
    return self;
}

#pragma mark - <DefaultPhotoDetailsPresenter>

- (void)loadContent {
    IGFeedItemModel *photo = [self.interactor photoWithID:self.photoID];
    [self.view showPhotoDetails:[self.viewModelBuilder buildPhotoDetailsViewModelFromPhoto:photo]];    
}

@end