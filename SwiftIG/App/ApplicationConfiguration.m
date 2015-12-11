#import "ApplicationConfiguration.h"
#import "AppDelegate.h"
#import "SearchUsersModuleBuilder.h"

@implementation ApplicationConfiguration

- (AppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(searchUsersModuleBuilder) with:self.searchUsersModuleBuilder];
    }];
}

@end