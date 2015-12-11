#import "SearchedUsersStore.h"

@interface PersistentUsersStore : NSObject <SearchedUsersStore>

- (instancetype)initWithUserDefaults:(NSUserDefaults *)userDefaults;

@end