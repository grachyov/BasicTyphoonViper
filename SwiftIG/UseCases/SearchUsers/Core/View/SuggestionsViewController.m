#import "SuggestionsViewController.h"
#import "UserViewModel.h"

@implementation SuggestionsViewController

static NSString * const SuggestionsCellReuseID = @"SuggestionsCellReuseID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:SuggestionsCellReuseID];
}

- (void)setSuggestions:(NSArray<UserViewModel *> *)suggestions {
    if ([suggestions isEqual:_suggestions]) {
        return;
    }
    _suggestions = suggestions;
    [self.tableView reloadData];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.suggestions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SuggestionsCellReuseID
                                                            forIndexPath:indexPath];
    
    cell.textLabel.text = [self.suggestions[indexPath.row] username];
    
    return cell;
}

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.didSelectSugestionHandler(self.suggestions[indexPath.row]);
}

@end
