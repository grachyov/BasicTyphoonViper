#import "DefaultSearchUsersPresenter.h"
#import "SearchUsersView.h"
#import "SearchUsersInteractor.h"
#import "SearchUsersViewModelBuilder.h"
#import "SearchUsersWireframe.h"
#import "UserViewModel.h"

@interface DefaultSearchUsersPresenter ()

@property (nonatomic, strong) id<SearchUsersInteractor> interactor;
@property (nonatomic, strong) id<SearchUsersViewModelBuilder> viewModelBuilder;
@property (nonatomic, strong) NSMutableSet<NSString *> *recentSearches;
@property (nonatomic, copy) NSString *lastQuery;

@end

@implementation DefaultSearchUsersPresenter

-(instancetype)initWithInteractor:(id<SearchUsersInteractor>)interactor
                 viewModelBuilder:(id<SearchUsersViewModelBuilder>)viewModelBuilder {
    if (self = [super init]) {
        _interactor = interactor;
        _viewModelBuilder = viewModelBuilder;
        _recentSearches = [NSMutableSet set];
    }
    return self;
}

#pragma mark - <SearchUsersPresenter>

- (void)loadContent {
    NSArray *recetnSearches = [self.viewModelBuilder buildSuggestedUsersFromUsers:[self.interactor recentlySearchedUsers]];
    for (UserViewModel *user in recetnSearches) {
        [self pushNewRecentSearchIfUnique:user];
    }
}

- (void)searchForUsers:(NSString *)query {
    if ([query isEqualToString:self.lastQuery]) {
        return;
    }
    
    if (query.length == 0) {
        [self.view hideSuggestions];
        return;
    }

    self.lastQuery = query;
    [self.view showSuggestions];
    
    __weak typeof(self) wSelf = self;
    
    [self.interactor searchForUsers:query completion:^(NSArray<IGUserModel *> *users, NSError *error) {
        __strong typeof(self) sSelf = wSelf;
        if (error) {
            [sSelf.view showError:[sSelf.viewModelBuilder buildSearchUsersError:error]];
        } else {
            [sSelf.view showSuggestedUsers:[sSelf.viewModelBuilder buildSuggestedUsersFromUsers:users]];
        }
    }];
}

- (void)showPhotosFeedForUser:(UserViewModel *)user {
    [self.interactor saveRecentlySearchedUser:user.ID];
    [self pushNewRecentSearchIfUnique:user];
    [self.wireframe showPhotosFeedForUserID:user.ID];
}

#pragma mark - <Private>

- (void)pushNewRecentSearchIfUnique:(UserViewModel *)user {
    if ([self.recentSearches containsObject:user.ID]) {
        return;
    }
    [self.recentSearches addObject:user.ID];
    [self.view pushRecentlySearchedUser:user];
}

@end
