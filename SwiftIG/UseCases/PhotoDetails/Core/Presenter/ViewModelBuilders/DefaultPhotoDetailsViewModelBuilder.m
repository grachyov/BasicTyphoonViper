#import "DefaultPhotoDetailsViewModelBuilder.h"
#import "PhotoDetailsViewModel.h"
#import "IGFeedItemModel.h"
#import "IGCommentModel.h"
#import "NSArray+SGAdditions.h"


@implementation DefaultPhotoDetailsViewModelBuilder

#pragma mark - <PhotoDetailsViewModelBuilder>

- (PhotoDetailsViewModel *)buildPhotoDetailsViewModelFromPhoto:(IGFeedItemModel *)feedItem {
    PhotoDetailsViewModel *vm = [[PhotoDetailsViewModel alloc] init];
    vm.imageUrl = feedItem.image;
    
    vm.comments = [feedItem.comments sg_map:^id(IGCommentModel *c) {
        return [self formattedCommentFromModel:c];
    }];
    
    return vm;
}

#pragma mark - Private

- (NSAttributedString *)formattedCommentFromModel:(IGCommentModel *)model {
    NSString *text = [NSString stringWithFormat:@"@%@ %@", model.username, model.text];
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc] initWithString:text
                                                                               attributes:[self aliasAttributes]];
    NSRange aliasRange = [text rangeOfString:[NSString stringWithFormat:@"@%@", model.username]];
    [result setAttributes:[self commentAttributes] range:aliasRange];
    return result.copy;
}

- (NSDictionary *)aliasAttributes {
    return @{
        NSForegroundColorAttributeName : UIColor.darkGrayColor,
        NSFontAttributeName: [UIFont systemFontOfSize:12]
    };
}

- (NSDictionary *)commentAttributes {
    return @{
        NSForegroundColorAttributeName : UIColor.blueColor,
        NSFontAttributeName: [UIFont systemFontOfSize:12]
    };
}

@end