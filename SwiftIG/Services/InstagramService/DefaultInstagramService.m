#import <Mantle/Mantle.h>
#import "DefaultInstagramService.h"
#import "RESTClient.h"
#import "IGUserModel.h"
#import "IGFeedItemModel.h"

@interface DefaultInstagramService ()

@property (nonatomic, strong) id<RESTClient> restClient;
@property (nonatomic, strong) NSURL *baseUrl;
@property (nonatomic, copy) NSString *clientID;

@end

@implementation DefaultInstagramService

- (instancetype)initWithRESTClient:(id<RESTClient>)restClient
                           baseUrl:(NSURL *)baseUrl
                          clientID:(NSString *)clientID {
    if (self = [super init]) {
        _restClient = restClient;
        _baseUrl = baseUrl;
        _clientID = [clientID copy];
    }
    return self;
}

- (void)findUser:(NSString *)query
      completion:(void (^)(NSArray<IGUserModel *> *users, NSError *error))completion {
    
    [self.restClient doGET:[self usersSearchUrl]
                    params:[self defaultParamsByAddingParams:@{ @"q" : query}]
                completion:^(NSDictionary *result, NSURLResponse *response, NSError *error) {
                    NSError *mantleError;
                    NSArray *users = [MTLJSONAdapter modelsOfClass:[IGUserModel class]
                                                     fromJSONArray:result[@"data"]
                                                             error:&mantleError];
                    if (mantleError) {
                        completion(nil, mantleError);
                    } else {
                        completion(users, nil);
                    }
                }];
}

- (void)fetchUserFeed:(NSString *)userID
           completion:(void (^)(NSArray<IGFeedItemModel *> *feed, NSError *error))completion {
    
    [self.restClient doGET:[self photosFeedUrl:userID] 
                    params:[self defaultParamsByAddingParams:@{ @"count": @30 }]
                completion:^(NSDictionary *result, NSURLResponse *response, NSError *error) {
                    NSError *mantleError;
                    NSArray *photos = [MTLJSONAdapter modelsOfClass:[IGFeedItemModel class]
                                                      fromJSONArray:result[@"data"]
                                                              error:&mantleError];
                    if (mantleError) {
                        completion(nil, mantleError);
                    } else {
                        completion(photos, nil);
                    }
                }];
}

#pragma mark - Private

- (NSDictionary *)defaultParams {
    return @{ @"client_id": self.clientID };
}

- (NSDictionary *)defaultParamsByAddingParams:(NSDictionary *)params {
    NSMutableDictionary *result = [[self defaultParams] mutableCopy];
    [result addEntriesFromDictionary:params];
    return [result copy];
}

- (NSURL *)usersSearchUrl {
    return [NSURL URLWithString:@"v1/users/search/" relativeToURL:self.baseUrl];
}

- (NSURL *)photosFeedUrl:(NSString *)userID {
    NSString *path = [NSString stringWithFormat:@"v1/users/%@/media/recent/", userID];
    return [NSURL URLWithString:path relativeToURL:self.baseUrl];
}

@end
