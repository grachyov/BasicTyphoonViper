#import "TemporaryInstagramDataStore.h"
#import "IGFeedItemModel.h"

@interface TemporaryInstagramDataStore()

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSArray<IGFeedItemModel *> *>  *feeds;
@property (nonatomic, strong) NSMutableDictionary<NSString *, IGFeedItemModel *> *photos;

@end

@implementation TemporaryInstagramDataStore

- (instancetype)init {
    if (self = [super init]) {
        _feeds = [NSMutableDictionary dictionary];
        _photos = [NSMutableDictionary dictionary];
    }
    
    return self;
}

#pragma mark - <InstagramDataStore>

- (void)storeFeed:(NSArray<IGFeedItemModel *> *)feed forUserID:(NSString *)userID {
    self.feeds[userID] = feed;
    
    for (IGFeedItemModel *photo in feed) {
        self.photos[photo.ID] = photo;
    }
}

- (NSArray<IGFeedItemModel *> *)feedForUserID:(NSString *)userID {
    return self.feeds[userID];
}

- (IGFeedItemModel *)feedItemWithID:(NSString *)photoID {
    return self.photos[photoID];
}

@end
