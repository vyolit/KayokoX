//
//  PreferenceWindowController.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <AppKit/AppKit.h>
#import "PreferenceTabViewController.h"

typedef NS_ENUM(NSUInteger, PreferenceTabTypes) {
    PreferenceTabGeneral = 0,
    PreferenceTabClipboard = 1,
    PreferenceTabAbout = 2
};

@interface PreferenceWindowController : NSWindowController {
    BOOL _hasCenteredWindow;
}
- (void)show;
- (void)showWithTab:(PreferenceTabTypes)tab;
@end
