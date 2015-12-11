@import UIKit;
#import <Typhoon/Typhoon.h>
@class PhotosFeedModuleBuilder;
@class CoreServicesConfiguration;

@interface SearchUsersModuleBuilder : TyphoonAssembly 

@property (nonatomic, readonly) PhotosFeedModuleBuilder *photosFeedModuleBuilder;
@property (nonatomic, readonly) CoreServicesConfiguration *coreServices;

- (UIViewController *)searchUsersView;

@end