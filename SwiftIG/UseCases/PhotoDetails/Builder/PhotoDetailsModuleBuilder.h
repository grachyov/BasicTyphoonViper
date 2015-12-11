@import UIKit;
@class CoreServicesConfiguration;
#import <Typhoon/Typhoon.h>

@interface PhotoDetailsModuleBuilder : TyphoonAssembly

@property (nonatomic, readonly) CoreServicesConfiguration *coreServices;

- (UIViewController *)photoDetailsViewWithPhotoID:(NSString *)photoID;

@end