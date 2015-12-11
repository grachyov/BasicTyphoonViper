#import <Mantle/Mantle.h>
@class IGCommentModel;

@interface IGFeedItemModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, strong) NSURL *thumbnailImage;
@property (nonatomic, strong) NSURL *image;
@property (nonatomic, copy) NSArray<IGCommentModel *> *comments;

@end