@import UIKit;

@class CoreServicesConfiguration;
@class PhotoDetailsModuleBuilder;

#import <Typhoon/Typhoon.h>

@interface PhotosFeedModuleBuilder: TyphoonAssembly 

@property (nonatomic, readonly) CoreServicesConfiguration *coreServices;
@property (nonatomic, readonly) PhotoDetailsModuleBuilder *photoDetailsModuleBuilder;

- (UIViewController *)photosFeedViewWithUserID:(NSString *)userID;

@end