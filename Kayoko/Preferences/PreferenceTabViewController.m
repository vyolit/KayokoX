//
//  PreferenceTabViewController.m
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import "PreferenceTabViewController.h"

@implementation PreferenceTabViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTabStyle:NSTabViewControllerTabStyleToolbar];

    NSTabViewItem* generalTabItem = [[NSTabViewItem alloc] initWithIdentifier:@"General"];
    [generalTabItem setViewController:[[GeneralPreferenceViewController alloc] init]];
    [generalTabItem setLabel:NSLocalizedString(@"PreferencesTabGeneral", nil)];
    [generalTabItem setImage:[NSImage imageWithSystemSymbolName:@"gearshape" accessibilityDescription:nil]];
    [self addTabViewItem:generalTabItem];

    NSTabViewItem* clipboardTabItem = [[NSTabViewItem alloc] initWithIdentifier:@"Clipboard"];
    [clipboardTabItem setViewController:[[ClipboardPreferenceViewController alloc] init]];
    [clipboardTabItem setLabel:NSLocalizedString(@"PreferencesTabClipboard", nil)];
    [clipboardTabItem setImage:[NSImage imageWithSystemSymbolName:@"doc.on.clipboard" accessibilityDescription:nil]];
    [self addTabViewItem:clipboardTabItem];

    NSTabViewItem* extrasTabItem = [[NSTabViewItem alloc] initWithIdentifier:@"Extras"];
    [extrasTabItem setViewController:[[ExtrasPreferenceViewController alloc] init]];
    [extrasTabItem setLabel:NSLocalizedString(@"PreferencesTabExtras", nil)];
    [extrasTabItem setImage:[NSImage imageWithSystemSymbolName:@"sparkles" accessibilityDescription:nil]];
    [self addTabViewItem:extrasTabItem];

    NSTabViewItem* aboutTabItem = [[NSTabViewItem alloc] initWithIdentifier:@"About"];
    [aboutTabItem setViewController:[[AboutPreferenceViewController alloc] init]];
    [aboutTabItem setLabel:NSLocalizedString(@"PreferencesTabAbout", nil)];
    [aboutTabItem setImage:[NSImage imageWithSystemSymbolName:@"info.circle" accessibilityDescription:nil]];
    [self addTabViewItem:aboutTabItem];
}

- (void)viewDidAppear {
    [super viewDidAppear];
    [[[self view] window] setTitle:[[self tabViewItems][0] label]];
}

- (void)tabView:(NSTabView *)tabView didSelectTabViewItem:(NSTabViewItem *)tabViewItem {
    [super tabView:tabView didSelectTabViewItem:tabViewItem];
    [[[self view] window] setTitle:[tabViewItem label]];
}
@end
