#import "DefaultSearchUsersWireframe.h"
#import "PhotosFeedModuleBuilder.h"

@interface DefaultSearchUsersWireframe ()

@property (nonatomic, strong) PhotosFeedModuleBuilder *photosFeedModuleBuilder;

@end

@implementation DefaultSearchUsersWireframe

-(instancetype)initWithPhotosFeedModuleBuilder:(PhotosFeedModuleBuilder *)photsFeedModuleBuilder {
    if (self = [super init]) {
        _photosFeedModuleBuilder = photsFeedModuleBuilder;
    }
    return self;
}

#pragma mark - <SearchUsersWireframe>

- (void)showPhotosFeedForUserID:(NSString *)userID {
    UIViewController *photosFeed = [self.photosFeedModuleBuilder photosFeedViewWithUserID:userID];
    [self.viewController.navigationController pushViewController:photosFeed animated:YES];
}

@end