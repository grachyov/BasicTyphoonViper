@import UIKit;
@class PhotoDetailsModuleBuilder;

#import "PhotosFeedWireframe.h"

@interface DefaultPhotosFeedWireframe : NSObject <PhotosFeedWireframe>

@property (nonatomic, weak) UIViewController *viewController;

- (instancetype)initWithPhotoDetailsModuleBuilder:(PhotoDetailsModuleBuilder *)photoDetailsModuleBuilder;

@end