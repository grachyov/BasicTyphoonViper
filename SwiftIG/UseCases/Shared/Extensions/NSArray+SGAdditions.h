@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (SGAdditions)

- (NSArray *)sg_map:(id (^)(id))block;

@end

NS_ASSUME_NONNULL_END
