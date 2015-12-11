#import "AppDelegate.h"
#import "SearchUsersModuleBuilder.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [self rootViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIViewController *)rootViewController {
    UIViewController *rootVC = [self.searchUsersModuleBuilder searchUsersView];
    return [[UINavigationController alloc] initWithRootViewController:rootVC];
}

@end
