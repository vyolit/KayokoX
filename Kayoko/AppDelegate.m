//
//  AppDelegate.m
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate
- (void)applicationWillFinishLaunching:(NSNotification *)notification {
    [[Environment sharedInstance] setAppDelegate:self];
    [[Environment sharedInstance] setPasteboardManager:[[PasteboardManager alloc] init]];
    [[Environment sharedInstance] setPreferenceLoader:[[PreferenceManager alloc] init]];
    [[Environment sharedInstance] setPreferenceWindowController:[[PreferenceWindowController alloc] init]];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [self reloadItems];
    [self loadPreferences];
}

- (void)reloadItems {
    [_statusItem setMenu:[[NSMenu alloc] init]];

    // clipboard history
    NSMenuItem* clipboardHistoryItem = [[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"StatusItemClipboardHistory", nil) action:nil keyEquivalent:@""];
    [clipboardHistoryItem setSubmenu:[[PasteboardHistoryMenu alloc] init]];
    [[_statusItem menu] addItem:clipboardHistoryItem];
    
    // extras
    BOOL addSongLinkOption = [[[Environment sharedInstance] preferenceLoader] addSongLinkOption];
    BOOL addTranslateOption = [[[Environment sharedInstance] preferenceLoader] addTranslateOption];
    if (addSongLinkOption || addTranslateOption) {
        NSMenuItem* extrasItem = [[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"StatusItemExtras", nil) action:nil keyEquivalent:@""];
        [extrasItem setSubmenu:[[ExtrasMenu alloc] init]];
        [[_statusItem menu] addItem:extrasItem];
    }

    [[_statusItem menu] addItem:[NSMenuItem separatorItem]];

    // about
    [[_statusItem menu] addItem:[[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"StatusItemAbout", nil), [CommonUtil appName]] action:@selector(openAbout) keyEquivalent:@""]];

    // preferences
    [[_statusItem menu] addItem:[[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"StatusItemPreferences", nil) action:@selector(openPreferences) keyEquivalent:@","]];
    [[_statusItem menu] addItem:[NSMenuItem separatorItem]];

    // quit
    [[_statusItem menu] addItem:[[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"%@ %@...", NSLocalizedString(@"StatusItemQuit", nil), [CommonUtil appName]] action:@selector(quit) keyEquivalent:@"q"]];
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
            [[_statusItem button] setTitle:[CommonUtil appName]];
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
    NSUInteger statusItemTitleType = [[[Environment sharedInstance] preferenceLoader] statusItemTitleType];
    NSString* customStatusItemTitle = [[[Environment sharedInstance] preferenceLoader] customStatusItemTitle];

    if (statusItemTitleType == kStatusItemTitleTypeAppName) {
        [self updateStatusIconUsingIcon:NO andTitle:@""];
    } else if (statusItemTitleType == kStatusItemTitleTypeIcon) {
        [self updateStatusIconUsingIcon:YES andTitle:@""];
    } else if (statusItemTitleType == kStatusItemTitleTypeCustomText) {
        [self updateStatusIconUsingIcon:NO andTitle:customStatusItemTitle];
    }
}
@end
