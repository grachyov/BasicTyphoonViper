#import <Typhoon/Typhoon.h>
@class SearchUsersModuleBuilder;

@interface ApplicationConfiguration : TyphoonAssembly
@property (nonatomic, strong) SearchUsersModuleBuilder *searchUsersModuleBuilder;
@end