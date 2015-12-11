#import "UIAlertController+SGAdditions.h"
#import "ErrorViewModel.h"

@implementation UIAlertController (SGAdditions)

+ (void)sg_presentAlertForViewModel:(ErrorViewModel *)error viewController:(UIViewController *)viewController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:error.title
                                                                             message:error.text
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Got it", nil)
                                                        style:UIAlertActionStyleDefault
                                                      handler:nil]];
    
    // Because iOS is hard: https://forums.developer.apple.com/thread/5268
    UIViewController *properPresentingVC = viewController.presentedViewController ?: viewController;
    
    [properPresentingVC presentViewController:alertController animated:YES completion:nil];
}

@end