@import Foundation;
@protocol RESTClient;
#import "InstagramService.h"

NS_ASSUME_NONNULL_BEGIN

@interface DefaultInstagramService : NSObject <InstagramService>

- (instancetype)initWithRESTClient:(id<RESTClient>)restClient
                           baseUrl:(NSURL *)baseUrl
                          clientID:(NSString *)clientID;

@end

NS_ASSUME_NONNULL_END
