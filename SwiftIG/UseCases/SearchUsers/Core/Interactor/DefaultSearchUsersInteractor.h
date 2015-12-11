#import "SearchUsersInteractor.h"
@protocol InstagramService;
@protocol SearchedUsersStore;

@interface DefaultSearchUsersInteractor : NSObject <SearchUsersInteractor>

- (instancetype)initWithInstagramService:(id<InstagramService>)instagramService 
                              usersStore:(id<SearchedUsersStore>)usersStore;

@end