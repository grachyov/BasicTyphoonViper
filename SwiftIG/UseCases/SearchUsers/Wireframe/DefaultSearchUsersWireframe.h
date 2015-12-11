@import UIKit;
#import "SearchUsersWireframe.h"
@class PhotosFeedModuleBuilder;

@interface DefaultSearchUsersWireframe : NSObject <SearchUsersWireframe>

@property (nonatomic, weak) UIViewController *viewController;

- (instancetype)initWithPhotosFeedModuleBuilder:(PhotosFeedModuleBuilder *)photsFeedModuleBuilder;

@end