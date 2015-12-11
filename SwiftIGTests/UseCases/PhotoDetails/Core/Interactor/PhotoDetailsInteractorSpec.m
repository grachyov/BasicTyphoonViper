#import <Kiwi/Kiwi.h>
#import "DefaultPhotoDetailsInteractor.h"
#import "InstagramDataStore.h"
#import "IGFeedItemModel.h"

SPEC_BEGIN(PhotoDetailsInteractorSpec)

describe(@"Photo Details Interactor", ^{
    __block DefaultPhotoDetailsInteractor *interactor;
    __block NSObject<InstagramDataStore> *stubStore;
    
    beforeEach(^{
        stubStore = [KWMock nullMockForProtocol:@protocol(InstagramDataStore)];
        interactor = [[DefaultPhotoDetailsInteractor alloc] initWithPhotosStore:stubStore];
    });
    
    context(@"given photo ID", ^{
       it(@"provides photo model", ^{
           IGFeedItemModel *photo = [[IGFeedItemModel alloc] init];
           
           [[stubStore should] receive:@selector(feedItemWithID:) andReturn:photo withArguments:@"42"];
    
           IGFeedItemModel *result = [interactor photoWithID:@"42"];
           
           [[result should] equal:photo];
       });
    });
});

SPEC_END
