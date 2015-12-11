#import "IGFeedItemModel.h"
#import "IGCommentModel.h"

@implementation IGFeedItemModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"ID": @"id",
        @"thumbnailImage": @"images.thumbnail.url",
        @"image": @"images.standard_resolution.url",
        @"comments": @"comments.data"
    };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)commentsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[IGCommentModel class]];
}

+ (NSValueTransformer *)thumbnailImageJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end