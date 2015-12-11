#import <Mantle/Mantle.h>

@interface IGCommentModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *text;

@end