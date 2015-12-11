#import "PersistentUsersStore.h"
#import "IGUserModel.h"

@interface PersistentUsersStore ()

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation PersistentUsersStore

static NSString * const PersistentUsersStoreKey = @"PersistentUsersStoreKey";

- (instancetype)initWithUserDefaults:(NSUserDefaults *)userDefaults {
    if (self = [super init]) {
        _userDefaults = userDefaults;
    }
    return self;
}

#pragma mark - <SearchedUsersStore>

- (void)saveUser:(IGUserModel *)user {
    NSArray *users = [[self loadUsers] arrayByAddingObject:user];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:users];
    [self.userDefaults setObject:data forKey:PersistentUsersStoreKey];
}

- (NSArray<IGUserModel *> *)loadUsers {
    NSData *data = [self.userDefaults objectForKey:PersistentUsersStoreKey];
    return data ? [NSKeyedUnarchiver unarchiveObjectWithData:data] : @[];
}

@end