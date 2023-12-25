//
//  PasteboardHistoryWindowController.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "PasteboardHistoryWindowController.h"

@implementation PasteboardHistoryWindowController
- (instancetype)init {
    return [self initWithWindowNibName:@""];
}

- (void)loadWindow {
    [self setWindow:[[NSWindow alloc] initWithContentRect:CGRectZero styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable backing:NSBackingStoreBuffered defer:YES]];
}

- (void)windowDidLoad {
    [super windowDidLoad];
    [self setContentViewController:[[PasteboardHistoryViewController alloc] init]];
    [[self window] setTitle:@"Management"];
}

- (void)show {
    if ([[self window] isVisible]) {
        return;
    }

    [NSApp activateIgnoringOtherApps:YES];
    
    // Center the preferences window somehow when opened for the first time.
    if (!_hasCenteredWindow) {
        [[self window] center];
        _hasCenteredWindow = YES;
    }
    
    [self showWindow:nil];
    [[self window] makeKeyAndOrderFront:nil];
}
@end
