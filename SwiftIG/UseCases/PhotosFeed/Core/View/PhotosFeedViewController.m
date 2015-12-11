#import "PhotosFeedViewController.h"
#import "PhotosFeedCell.h"
#import "PhotosFeedPresenter.h"
#import "PhotosFeedItemViewModel.h"
#import "PhotoDetailsPresenter.h"
#import "ErrorViewModel.h"
#import "UIAlertController+SGAdditions.h"

@interface PhotosFeedViewController ()

@property (nonatomic, copy) NSArray<PhotosFeedItemViewModel *> *photos;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation PhotosFeedViewController

static NSString * const PhotoCellReuseID = @"PhotoCellReuseID";

- (instancetype)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];

    [self.refreshControl beginRefreshing];
    [self.presenter loadContent];
}

#pragma mark - Actions

- (void)refreshControlDidRefresh:(id)sender {
    [self.presenter loadContentIngoringCache];
}

#pragma mark - <PhotosFeedView>

- (void)showPhotos:(NSArray<PhotosFeedItemViewModel *> *)photos {
    self.photos = photos;
    [self.refreshControl endRefreshing];
    [self.collectionView reloadData];
}

- (void)showError:(ErrorViewModel *)error {
    [self.refreshControl endRefreshing];
    [UIAlertController sg_presentAlertForViewModel:error viewController:self];
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotosFeedCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoCellReuseID
                                                                     forIndexPath:indexPath];
    
    [cell setImageUrl:[self.photos[indexPath.row] url]];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotosFeedItemViewModel *photo = self.photos[indexPath.row];
    [self.presenter showPhotoDetails:photo.ID];
}

#pragma mark - Private

- (void)setupView {
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.alwaysBounceVertical = YES;
    [self.collectionView registerClass:[PhotosFeedCell class] forCellWithReuseIdentifier:PhotoCellReuseID];
    [self adjustCollectionViewLayout];
    [self.collectionView addSubview:self.refreshControl];
}

- (void)adjustCollectionViewLayout {
    CGFloat interItemSize = 2.0;
    NSInteger itemsPerRow = 4;
    UICollectionViewFlowLayout *layout = ((UICollectionViewFlowLayout *)self.collectionViewLayout);
    layout.minimumInteritemSpacing = interItemSize;
    layout.minimumLineSpacing = interItemSize;
    CGFloat thumbWidth = (CGRectGetWidth(self.view.bounds) - interItemSize * (itemsPerRow - 1)) / itemsPerRow;
    layout.itemSize = CGSizeMake(thumbWidth, thumbWidth);
}

- (UIRefreshControl *)refreshControl {
    if (_refreshControl == nil) {
        _refreshControl = [[UIRefreshControl alloc] init];
        _refreshControl.tintColor = [UIColor grayColor];
        [_refreshControl addTarget:self 
                            action:@selector(refreshControlDidRefresh:) 
                  forControlEvents:UIControlEventValueChanged];
    }
    return _refreshControl;
} 

@end
