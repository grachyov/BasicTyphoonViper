#import <Typhoon/Typhoon.h>
@protocol InstagramService;
@protocol RESTClient;
@protocol InstagramDataStore;

@interface CoreServicesConfiguration : TyphoonAssembly 

- (id<InstagramService>)instagramService;
- (id<InstagramDataStore>)instagramDataStore;
- (id<RESTClient>)restClient;

@end