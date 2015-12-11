#import "DefaultSearchUsersInteractor.h"
#import "InstagramService.h"
#import "SearchedUsersStore.h"

@interface DefaultSearchUsersInteractor ()
@property (nonatomic, strong) id<InstagramService> instagramService;
@property (nonatomic, strong) id<SearchedUsersStore> usersStore;
@property (nonatomic, copy) NSArray<IGUserModel *> *recentSearchResults;
@end

@implementation DefaultSearchUsersInteractor

- (instancetype)initWithInstagramService:(id<InstagramService>)instagramService 
                              usersStore:(id<SearchedUsersStore>)usersStore {
    if (self = [super init]) {
        _instagramService = instagramService;
        _usersStore = usersStore;
    }
    return self;
}

#pragma mark - <SearchUsersInteractor>

- (void)searchForUsers:(NSString *)query completion:(void (^)(NSArray<IGUserModel *> *users, NSError *error))completion {
    __weak typeof(self) wSelf = self;
    
    [self.instagramService findUser:query completion:^(NSArray<IGUserModel *> *users, NSError *error) {
        __strong typeof(self) sSelf = wSelf;
        
        if (users.count > 0) {
            sSelf.recentSearchResults = users;
        }
        completion(users, error);
    }];
}

- (void)saveRecentlySearchedUser:(NSString *)userID {
    [self.usersStore saveUser:[self userWithID:userID]];
}

- (NSArray<IGUserModel *> *)recentlySearchedUsers {
    return [self.usersStore loadUsers];
}

#pragma mark - Private

-(IGUserModel *)userWithID:(NSString *)userID {
    NSPredicate *findByUserID = [NSPredicate predicateWithFormat:@"ID == %@", userID];
    return [self.recentSearchResults filteredArrayUsingPredicate:findByUserID].firstObject;
}

@end
