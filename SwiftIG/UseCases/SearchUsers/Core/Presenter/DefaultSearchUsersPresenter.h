@import Foundation;
#import "SearchUsersPresenter.h"
@protocol SearchUsersView;
@protocol SearchUsersInteractor;
@protocol SearchUsersViewModelBuilder;
@protocol SearchUsersWireframe;

NS_ASSUME_NONNULL_BEGIN

@interface DefaultSearchUsersPresenter : NSObject <SearchUsersPresenter>
@property (nonatomic, weak, nullable) id<SearchUsersView> view;
@property (nonatomic, strong) id<SearchUsersWireframe> wireframe;

- (instancetype)initWithInteractor:(id<SearchUsersInteractor>)interactor 
                  viewModelBuilder:(id<SearchUsersViewModelBuilder>)viewModelBuilder;

@end

NS_ASSUME_NONNULL_END
