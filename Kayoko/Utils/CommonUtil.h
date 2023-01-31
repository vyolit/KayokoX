//
//  CommonUtil.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <AppKit/AppKit.h>

@interface CommonUtil : NSObject
+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message withDismissButtonTitle:(NSString *)dismissButtonTitle;
+ (NSImage *)appIcon;
+ (NSString *)appBundleIdentifier;
+ (NSString *)appName;
+ (NSString *)appVersion;
@end
