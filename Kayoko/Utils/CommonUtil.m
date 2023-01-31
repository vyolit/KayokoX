//
//  CommonUtil.m
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import "CommonUtil.h"

@implementation CommonUtil
+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message withDismissButtonTitle:(NSString *)dismissButtonTitle {
    NSAlert* alert = [[NSAlert alloc] init];
    [alert setMessageText:title];
    [alert setInformativeText:message];
    [alert addButtonWithTitle:dismissButtonTitle];
    [alert setAlertStyle:NSAlertStyleCritical];
    [alert runModal];
}

+ (NSImage*)appIcon {
    return [NSImage imageNamed:[[NSBundle mainBundle] infoDictionary][@"CFBundleIconFile"]];
}

+ (NSString *)appBundleIdentifier {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleIdentifier"];
}

+ (NSString *)appName {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
}

+ (NSString *)appVersion {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
}
@end
