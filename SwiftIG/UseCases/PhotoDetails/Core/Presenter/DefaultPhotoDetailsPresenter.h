#import "PhotoDetailsPresenter.h"
@protocol PhotoDetailsInteractor;
@protocol PhotoDetailsView;
@protocol PhotoDetailsViewModelBuilder;

NS_ASSUME_NONNULL_BEGIN

@interface DefaultPhotoDetailsPresenter : NSObject <PhotoDetailsPresenter>

@property (nonatomic, weak, nullable) id<PhotoDetailsView> view;

- (instancetype)initWithInteractor:(id<PhotoDetailsInteractor>)interactor
                  viewModelBuilder:(id<PhotoDetailsViewModelBuilder>)viewModelBuilder
                           photoID:(NSString *)photoID;

@end

NS_ASSUME_NONNULL_END
