//
//  AppDelegate.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate
- (void)applicationWillFinishLaunching:(NSNotification *)notification {
    [[Environment sharedInstance] setAppDelegate:self];
    [[Environment sharedInstance] setPreferenceManager:[[PreferenceManager alloc] init]];
    [[Environment sharedInstance] setPasteboardManager:[[PasteboardManager alloc] init]];
    [[Environment sharedInstance] setPreferenceWindowController:[[PreferenceWindowController alloc] init]];
    [[Environment sharedInstance] setPasteboardHistoryWindowController:[[PasteboardHistoryWindowController alloc] init]];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [self loadPreferences];
    [self reloadItems];
}

- (void)reloadItems {
    [_statusItem setMenu:[[NSMenu alloc] init]];

    // clipboard history
    NSMenuItem* clipboardHistoryItem = [[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"StatusItemClipboardHistory", nil) action:nil keyEquivalent:@""];
    [clipboardHistoryItem setSubmenu:[[PasteboardHistoryMenu alloc] init]];
    [[_statusItem menu] addItem:clipboardHistoryItem];
    
    NSMenuItem* manageHistoryItem = [[NSMenuItem alloc] initWithTitle:@"Manage" action:@selector(showManagement) keyEquivalent:@""];
    [[_statusItem menu] addItem:manageHistoryItem];

    [[_statusItem menu] addItem:[NSMenuItem separatorItem]];

    // about
    [[_statusItem menu] addItem:[[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"StatusItemAbout", nil), [CFUtil getName]] action:@selector(openAbout) keyEquivalent:@""]];

    // preferences
    [[_statusItem menu] addItem:[[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"StatusItemPreferences", nil) action:@selector(openPreferences) keyEquivalent:@","]];
    [[_statusItem menu] addItem:[NSMenuItem separatorItem]];

    // quit
    [[_statusItem menu] addItem:[[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"%@ %@...", NSLocalizedString(@"StatusItemQuit", nil), [CFUtil getName]] action:@selector(quit) keyEquivalent:@"q"]];
}

- (void)showManagement {
    [[[Environment sharedInstance] pasteboardHistoryWindowController] show];
}

- (void)openAbout {
    [[[Environment sharedInstance] preferenceWindowController] showWithTab:PreferenceTabAbout];
}

- (void)openPreferences {
    [[[Environment sharedInstance] preferenceWindowController] show];
}

- (void)quit {
    [[NSApplication sharedApplication] terminate:nil];
}

- (void)updateStatusIconUsingIcon:(BOOL)icon andTitle:(NSString *)title {
    if (!icon) {
        if ([title isEqualToString:@""]) {
            [[_statusItem button] setTitle:[CFUtil getName]];
        } else {
            [[_statusItem button] setTitle:title];
        }
        [[_statusItem button] setImage:nil];
    } else {
        [[_statusItem button] setTitle:@""];
        [[_statusItem button] setImage:[NSImage imageWithSystemSymbolName:@"scribble.variable" accessibilityDescription:nil]];
    }
}

- (void)loadPreferences {
    NSUInteger statusItemTitleType = [[[Environment sharedInstance] preferenceManager] statusItemTitleType];
    NSString* customStatusItemTitle = [[[Environment sharedInstance] preferenceManager] customStatusItemTitle];

    if (statusItemTitleType == kStatusItemTitleTypeIcon) {
        [self updateStatusIconUsingIcon:YES andTitle:@""];
    } else if (statusItemTitleType == kStatusItemTitleTypeCustomText) {
        [self updateStatusIconUsingIcon:NO andTitle:customStatusItemTitle];
    }
}
@end
