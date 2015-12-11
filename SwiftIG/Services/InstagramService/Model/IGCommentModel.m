#import "IGCommentModel.h"

@implementation IGCommentModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"username": @"from.username",
        @"text": @"text"
    };
}

@end