#import <Kiwi/Kiwi.h>
#import "PersistentUsersStore.h"
#import "IGUserModel.h"

SPEC_BEGIN(PersistentUsersStoreSpec)

describe(@"Persistent Users Store", ^{
    __block PersistentUsersStore *store;

    context(@"loading users", ^{
        context(@"when no users were saved", ^{
            it(@"returns empty array", ^{
                NSUserDefaults *stubDefaults = [KWMock nullMockForClass:[NSUserDefaults class]];
                store = [[PersistentUsersStore alloc] initWithUserDefaults:stubDefaults];
                
                [[[store loadUsers] should] equal:@[]];
            });
        });
        
        context(@"when user was saved before", ^{
            it(@"reads user data", ^{
                NSUserDefaults *stubDefaults = [KWMock nullMockForClass:[NSUserDefaults class]];
                store = [[PersistentUsersStore alloc] initWithUserDefaults:stubDefaults];
                
                [[stubDefaults should] receive:@selector(objectForKey:)];
                
                [store loadUsers];
            });
        });
    });
    
    context(@"when user was added", ^{
       it(@"writes user to the storage", ^{
           NSUserDefaults *mockDefaults = [KWMock nullMockForClass:[NSUserDefaults class]];
           store = [[PersistentUsersStore alloc] initWithUserDefaults:mockDefaults];
           
           [[mockDefaults should] receive:@selector(setObject:forKey:)];
           
           [store saveUser:[IGUserModel new]];
       });
    });
});

SPEC_END