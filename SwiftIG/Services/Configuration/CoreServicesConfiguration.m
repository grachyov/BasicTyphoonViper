#import "CoreServicesConfiguration.h"
#import "DefaultInstagramService.h"
#import "URLSessionRESTClient.h"
#import "TemporaryInstagramDataStore.h"

@implementation CoreServicesConfiguration

- (id<InstagramService>)instagramService {
    return [TyphoonDefinition withClass:[DefaultInstagramService class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithRESTClient:baseUrl:clientID:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self restClient]];
            [initializer injectParameterWith:[NSURL URLWithString:@"https://api.instagram.com"]];
            [initializer injectParameterWith:@"10d50dc6988f4818888dd8bde65edc9b"];
        }];
    }];
}

- (id<RESTClient>)restClient {
    return [TyphoonDefinition withClass:[URLSessionRESTClient class]];
}

- (id<InstagramDataStore>)instagramDataStore {
    return [TyphoonDefinition withClass:[TemporaryInstagramDataStore class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
    }];
}

@end