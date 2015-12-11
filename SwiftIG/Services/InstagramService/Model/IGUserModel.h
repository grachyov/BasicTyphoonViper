#import <Mantle/Mantle.h>

@interface IGUserModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, strong) NSURL *profilePicture;

@end