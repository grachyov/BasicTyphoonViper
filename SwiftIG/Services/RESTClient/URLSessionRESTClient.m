#import "URLSessionRESTClient.h"

@interface URLSessionRESTClient ()

@property (nonatomic, strong) NSURLSession *urlSession;

@end

@implementation URLSessionRESTClient

- (instancetype)init {
    if (self = [super init]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _urlSession = [NSURLSession sessionWithConfiguration:config
                                                    delegate:nil
                                               delegateQueue:[NSOperationQueue mainQueue]];
    }
    return self;
}

#pragma mark - <RESTClient>

- (void)doGET:(NSURL *)resource 
       params:(NSDictionary *)params 
   completion:(void (^)(id result, NSURLResponse *response, NSError *error))completion {
    
    NSURL *url = [self urlFromResource:resource params:params];
    NSURLSessionDataTask *task = [self.urlSession dataTaskWithURL:url
                   completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                       if (error) {
                           completion(nil, response, error);
                           return;
                       }
                       NSError *jsonError;
                       id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                       if (jsonError) {
                           completion(nil, response, error);
                           return;
                       }
                       
                       completion(json, response, nil);
                   }];
    
    
    [task resume];
}

#pragma mark - Private

- (NSURL *)urlFromResource:(NSURL *)resource params:(NSDictionary *)params {
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:[resource absoluteString]];
    urlComponents.queryItems = [self queryItemsFromDictionary:params];
    return urlComponents.URL;
}

- (NSArray *)queryItemsFromDictionary:(NSDictionary *)params {
    NSMutableArray *queryItems = [NSMutableArray array];
    [params enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSObject *value, BOOL *stop) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:[value description]]];
    }];
    return  [queryItems copy];
}

@end