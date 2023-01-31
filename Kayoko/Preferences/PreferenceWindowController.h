//
//  PreferenceWindowController.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <AppKit/AppKit.h>
#import "PreferenceTabViewController.h"

typedef NS_ENUM(NSUInteger, PreferenceTabTypes) {
    PreferenceTabGeneral = 0,
    PreferenceTabClipboard = 1,
    PreferenceTabExtras = 2,
    PreferenceTabAbout = 3,
};

@interface PreferenceWindowController : NSWindowController
- (void)show;
- (void)showWithTab:(PreferenceTabTypes)tab;
@end
