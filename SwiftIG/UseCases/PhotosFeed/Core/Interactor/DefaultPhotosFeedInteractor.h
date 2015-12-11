@import Foundation;

@protocol InstagramService;
@protocol InstagramDataStore;
#import "PhotosFeedInteractor.h"


@interface DefaultPhotosFeedInteractor : NSObject <PhotosFeedInteractor>

- (instancetype)initWithInstagramService:(id<InstagramService>)instagramService 
                               feedStore:(id<InstagramDataStore>)feedStore
                                  userID:(NSString *)userID;

@end