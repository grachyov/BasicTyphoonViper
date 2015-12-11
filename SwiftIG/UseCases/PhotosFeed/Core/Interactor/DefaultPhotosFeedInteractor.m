#import "DefaultPhotosFeedInteractor.h"
#import "InstagramService.h"
#import "InstagramDataStore.h"

@interface DefaultPhotosFeedInteractor ()

@property (nonatomic, strong) id<InstagramService> instagramService;
@property (nonatomic, strong) id<InstagramDataStore> feedStore;
@property (nonatomic, copy) NSString *userID;

@end


@implementation DefaultPhotosFeedInteractor

- (instancetype)initWithInstagramService:(id<InstagramService>)instagramService
                               feedStore:(id<InstagramDataStore>)feedStore
                                  userID:(NSString *)userID {   
    if (self = [super init]) {
        _instagramService = instagramService;
        _feedStore = feedStore;
        _userID = [userID copy];
    }
    return self;
}

- (void)fetchPhotosFeedAllowingCachedResponse:(BOOL)cacheAllowed 
                                   completion:(void (^)(NSArray<IGFeedItemModel *> *photos, NSError *error))completion {
    id cachedFeed = [self.feedStore feedForUserID:self.userID];
    if (cacheAllowed && cachedFeed) {
        completion(cachedFeed, nil);
        return;
    }

    __weak typeof(self) wSelf = self;
    [self.instagramService fetchUserFeed:self.userID completion:^(NSArray<IGFeedItemModel *> *feed, NSError *error) {
        __strong typeof(self) sSelf = wSelf;
        
        if (feed.count > 0) {
            [sSelf.feedStore storeFeed:feed forUserID:sSelf.userID];
        }
        completion(feed, error);
    }];
}

@end