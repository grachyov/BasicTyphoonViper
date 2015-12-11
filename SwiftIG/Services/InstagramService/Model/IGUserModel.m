#import "IGUserModel.h"

@implementation IGUserModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"ID": @"id",
        @"profilePicture": @"profile_picture",
        @"username": @"username"
    };
}

+ (NSValueTransformer *)profilePictureJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end