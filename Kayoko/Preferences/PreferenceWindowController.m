//
//  PreferenceWindowController.m
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import "PreferenceWindowController.h"

@implementation PreferenceWindowController
- (instancetype)init {
    return [self initWithWindowNibName:@""];
}

- (void)loadWindow {
    [self setWindow:[[NSWindow alloc] initWithContentRect:CGRectZero styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable backing:NSBackingStoreBuffered defer:YES]];
}

- (void)windowDidLoad {
    [super windowDidLoad];
    [self setContentViewController:[[PreferenceTabViewController alloc] init]];
}

- (void)show {
    if ([[self window] isVisible]) {
        return;
    }

    [NSApp activateIgnoringOtherApps:YES];
    [self showWindow:nil];
    [[self window] makeKeyAndOrderFront:nil];
}

- (void)showWithTab:(PreferenceTabTypes)tab {
    [self show];
    [[(PreferenceTabViewController *)[self contentViewController] tabView] selectTabViewItemAtIndex:tab];
}
@end
