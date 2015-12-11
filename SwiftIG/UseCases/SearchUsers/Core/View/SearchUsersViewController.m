#import "SearchUsersViewController.h"
#import "SuggestionsViewController.h"
#import "SearchUsersPresenter.h"
#import "UserViewModel.h"
#import "RecentSearchBubble.h"
#import "ParallaxEffect.h"
#import "BubblesAnimationController.h"
#import "UIAlertController+SGAdditions.h"

@interface SearchUsersViewController () <UISearchResultsUpdating>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) SuggestionsViewController *suggestionsViewController;
@property (nonatomic, strong) BubblesAnimationController *bubblesAnimationController;

@end

@implementation SearchUsersViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.bubblesAnimationController restart];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    
    [self addSelectedSuggestionHandler];
    [self.presenter loadContent];
}

#pragma mark - <SearchUsersPresenter>

- (void)showSuggestions {
    self.suggestionsViewController.view.hidden = NO;
}

- (void)hideSuggestions {
    self.suggestionsViewController.view.hidden = YES;
}

- (void)showSuggestedUsers:(NSArray *)users {
    self.suggestionsViewController.suggestions = users;
}

- (void)pushRecentlySearchedUser:(UserViewModel *)user {
    RecentSearchBubble *bubble = [[RecentSearchBubble alloc] init];
    [bubble setViewModel:user];
    
    [self.bubblesAnimationController addBubble:bubble];
    [self.view insertSubview:bubble belowSubview:self.suggestionsViewController.view];
}

- (void)showError:(ErrorViewModel *)error {
    [UIAlertController sg_presentAlertForViewModel:error viewController:self];
}

#pragma mark - <UISearchResultsUpdating>

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self.presenter searchForUsers:self.searchController.searchBar.text];
}

#pragma mark - Private 

- (void)addSelectedSuggestionHandler {
    __weak typeof(self) wSelf = self;
    self.suggestionsViewController.didSelectSugestionHandler = ^ (UserViewModel *suggestion) {
        [wSelf.presenter showPhotosFeedForUser:suggestion];
    };
}

- (void)setupView {
    self.searchController = [self newSearchController];
    
    [self.view addSubview:[self newBackground]];
    [self addChildViewController:self.suggestionsViewController];
    [self.view addSubview:self.suggestionsViewController.view];
    self.navigationItem.titleView = self.searchController.searchBar;
    UIEdgeInsets contentInset = UIEdgeInsetsMake(CGRectGetHeight(self.searchController.searchBar.bounds), 0, 0, 0);
    self.suggestionsViewController.tableView.contentInset = contentInset;
}

- (UIView *)newBackground {
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    background.contentMode = UIViewContentModeCenter;
    background.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    background.transform = CGAffineTransformMakeScale(1.1, 1.1);
    [ParallaxEffect attachToView:background];
    return background;
}

- (UISearchController *)newSearchController {
    UISearchController *sc = [[UISearchController alloc] initWithSearchResultsController:nil];
    sc.definesPresentationContext = YES;
    sc.hidesNavigationBarDuringPresentation = NO;
    sc.dimsBackgroundDuringPresentation = NO;
    sc.searchResultsUpdater = self;
    [sc.searchBar sizeToFit];
    return sc;
}

- (SuggestionsViewController *)suggestionsViewController {
    if (_suggestionsViewController == nil) {
        _suggestionsViewController = [[SuggestionsViewController alloc] init];
        _suggestionsViewController.view.hidden = YES;
    }
    return _suggestionsViewController;
}

- (BubblesAnimationController *)bubblesAnimationController {
    if (_bubblesAnimationController == nil) {
        _bubblesAnimationController = [[BubblesAnimationController alloc] initWithHostedView:self.view];
    }
    return _bubblesAnimationController;
}

@end
