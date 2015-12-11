@import Foundation;
@protocol PhotosFeedView;
@protocol PhotosFeedInteractor;
@protocol PhotosFeedViewModelBuilder;
@protocol PhotosFeedWireframe;
#import "PhotosFeedPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface DefaultPhotosFeedPresenter : NSObject <PhotosFeedPresenter>

@property (nonatomic, weak, nullable) id<PhotosFeedView> view;
@property (nonatomic, strong, nullable) id<PhotosFeedWireframe> wireframe;

- (instancetype)initWithInteractor:(id<PhotosFeedInteractor>)interactor 
                  viewModelBuilder:(id<PhotosFeedViewModelBuilder>)viewModelBuilder;

@end

NS_ASSUME_NONNULL_END
