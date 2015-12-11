@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@protocol RESTClient<NSObject>

- (void)doGET:(NSURL *)resource 
       params:(NSDictionary * _Nullable)params
   completion:(void (^)(id _Nullable result, NSURLResponse *response, NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
