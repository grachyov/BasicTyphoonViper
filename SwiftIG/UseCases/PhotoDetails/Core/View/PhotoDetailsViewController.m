#import "PhotoDetailsViewController.h"
#import "PhotoDetailsPresenter.h"
#import "PhotoDetailsViewModel.h"
#import "PhotosFeedCell.h"
#import "CommentCell.h"

@interface PhotoDetailsViewController ()

@property (nonatomic, strong) PhotoDetailsViewModel *photo;

@end

@implementation PhotoDetailsViewController

static NSString * const CommentCellReuseID = @"CommentCellReuseID";
static NSString * const PhotoCellReuseID = @"PhotoCellReuseID";

- (instancetype)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
  
    [self.presenter loadContent];
}

#pragma mark - <PhotoDetailsView>

- (void)showPhotoDetails:(PhotoDetailsViewModel *)photoDetails {
    self.photo = photoDetails;
    [self.collectionView reloadData];
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return self.photo.comments.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        PhotosFeedCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoCellReuseID
                                                                         forIndexPath:indexPath];
        cell.showsActivityIndicator = YES;
        [cell setImageUrl:self.photo.imageUrl];
        return cell;
    } else {
        CommentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CommentCellReuseID
                                                                      forIndexPath:indexPath];
        cell.label.attributedText = self.photo.comments[indexPath.row];
        
        return cell;
    }
}

#pragma mark - Private

- (void)setupView {
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[CommentCell class] forCellWithReuseIdentifier:CommentCellReuseID];
    [self.collectionView registerClass:[PhotosFeedCell class] forCellWithReuseIdentifier:PhotoCellReuseID];
    self.collectionView.alwaysBounceVertical = YES;
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    layout.estimatedItemSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 30);
}

@end
