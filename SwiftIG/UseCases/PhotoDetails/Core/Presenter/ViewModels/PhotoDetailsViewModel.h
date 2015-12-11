@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface PhotoDetailsViewModel : NSObject

@property (nonatomic, strong) NSURL *imageUrl;
@property (nonatomic, copy) NSArray<NSAttributedString *> *comments;

@end

NS_ASSUME_NONNULL_END