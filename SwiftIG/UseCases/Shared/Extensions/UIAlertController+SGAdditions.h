@import UIKit;
@class ErrorViewModel;

@interface UIAlertController (SGAdditions)

+ (void)sg_presentAlertForViewModel:(ErrorViewModel *)error viewController:(UIViewController *)viewController;

@end