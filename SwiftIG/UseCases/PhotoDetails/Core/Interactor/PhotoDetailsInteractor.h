@import Foundation;
@class IGFeedItemModel;

NS_ASSUME_NONNULL_BEGIN

@protocol PhotoDetailsInteractor<NSObject>

- (IGFeedItemModel *)photoWithID:(NSString *)ID;

@end

NS_ASSUME_NONNULL_END
