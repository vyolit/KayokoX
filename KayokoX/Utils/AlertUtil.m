//
//  AlertUtil.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "AlertUtil.h"

@implementation AlertUtil
+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message withDismissButtonTitle:(NSString *)dismissButtonTitle {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSAlert* alert = [[NSAlert alloc] init];
        [alert setMessageText:title];
        [alert setInformativeText:message];
        [alert addButtonWithTitle:dismissButtonTitle];
        [alert setAlertStyle:NSAlertStyleCritical];
        [alert runModal];
    });
}
@end
