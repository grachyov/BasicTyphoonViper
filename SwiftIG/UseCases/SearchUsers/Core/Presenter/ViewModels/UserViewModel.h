@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface UserViewModel : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, strong) NSURL *profilePicture;

@end

NS_ASSUME_NONNULL_END
