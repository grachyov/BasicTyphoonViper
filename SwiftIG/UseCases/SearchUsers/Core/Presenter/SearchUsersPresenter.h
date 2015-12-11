@import Foundation;
@class UserViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol SearchUsersPresenter<NSObject>

- (void)loadContent;
- (void)searchForUsers:(NSString *)query;
- (void)showPhotosFeedForUser:(UserViewModel *)user;

@end

NS_ASSUME_NONNULL_END
