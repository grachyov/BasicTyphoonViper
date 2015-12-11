#import "NSArray+SGAdditions.h"

@implementation NSArray (SGAdditions)

- (NSArray *)sg_map:(id (^)(id))block {
    NSParameterAssert(block != nil);
    
    NSMutableArray *result = [NSMutableArray array];
    
    for (id value in self) {
        id mappedValue = block(value);
        NSAssert(mappedValue != nil, @"Block cannot return nil.");
        [result addObject:mappedValue];
    }
    
    return [result copy];
}

@end