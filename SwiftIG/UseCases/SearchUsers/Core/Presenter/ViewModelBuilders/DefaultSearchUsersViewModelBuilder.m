#import "DefaultSearchUsersViewModelBuilder.h"
#import "NSArray+SGAdditions.h"
#import "UserViewModel.h"
#import "IGUserModel.h"
#import "ErrorViewModel.h"

@implementation DefaultSearchUsersViewModelBuilder

#pragma mark - <SearchUsersViewModelBuilder>

- (NSArray<UserViewModel *> *)buildSuggestedUsersFromUsers:(NSArray<IGUserModel *> *)users {
    return [users sg_map:^id(IGUserModel *user) {
        UserViewModel *vm = [[UserViewModel alloc] init];
        vm.profilePicture = user.profilePicture;
        vm.ID = user.ID;
        vm.username = user.username;
        
        return vm;
    }];
}

- (ErrorViewModel *)buildSearchUsersError:(NSError *)error {
    ErrorViewModel *vm = [[ErrorViewModel alloc] init];
    vm.title = NSLocalizedString(@"Whoops", nil);
    vm.text = NSLocalizedString(@"Something went wrong!", nil);
    return vm;
}

@end