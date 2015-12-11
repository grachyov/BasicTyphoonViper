#import <Kiwi/Kiwi.h>
#import "DefaultPhotoDetailsPresenter.h"
#import "PhotoDetailsInteractor.h"
#import "PhotoDetailsViewModelBuilder.h"
#import "PhotoDetailsView.h"
#import "PhotoDetailsViewModel.h"

SPEC_BEGIN(PhotoDetailsPresenterSpec)

describe(@"Photo Details Presenter", ^{
    __block DefaultPhotoDetailsPresenter *presenter;
    __block NSObject<PhotoDetailsInteractor> *stubInteractor;
    __block NSObject<PhotoDetailsViewModelBuilder> *stubViewModelBuilder;
    __block NSObject<PhotoDetailsView> *mockView;
    
    beforeEach(^{
        stubInteractor = [KWMock nullMockForProtocol:@protocol(PhotoDetailsInteractor)];
        stubViewModelBuilder = [KWMock nullMockForProtocol:@protocol(PhotoDetailsViewModelBuilder)];
        presenter = [[DefaultPhotoDetailsPresenter alloc] initWithInteractor:stubInteractor
                                                            viewModelBuilder:stubViewModelBuilder
                                                                     photoID:@"42"];
    });
    
    context(@"when told to load content", ^{
        it(@"asks interactor for photo", ^{
            [[stubInteractor should] receive:@selector(photoWithID:) withArguments:@"42"];
    
            [presenter loadContent];
        });
        
        it(@"passes photo view model to view", ^{
            PhotoDetailsViewModel *vm = [[PhotoDetailsViewModel alloc] init];
    
            [[stubViewModelBuilder should] receive:@selector(buildPhotoDetailsViewModelFromPhoto:) andReturn:vm];
            
            mockView = [KWMock nullMockForProtocol:@protocol(PhotoDetailsView)];
            presenter.view = mockView;
            
            [[mockView should] receive:@selector(showPhotoDetails:) withArguments:vm];
    
            [presenter loadContent];
        });
    });
});

SPEC_END
