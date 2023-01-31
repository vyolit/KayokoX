//
//  ExtrasMenu.m
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import "ExtrasMenu.h"

@implementation ExtrasMenu
- (instancetype)initWithTitle:(NSString *)title {
    self = [super initWithTitle:title];

    if (self) {
        [self setDelegate:self];
    }

    return self;
}

- (void)menuWillOpen:(NSMenu *)menu {
    BOOL addSongLinkOption = [[[Environment sharedInstance] preferenceLoader] addSongLinkOption];
    BOOL addTranslateOption = [[[Environment sharedInstance] preferenceLoader] addTranslateOption];
        
    if (addSongLinkOption) {
        NSMenuItem* songLinkItem = [[NSMenuItem alloc] init];
        [songLinkItem setTarget:self];
        [songLinkItem setTitle:NSLocalizedString(@"ExtrasSubmenuSongLink", nil)];
        [songLinkItem setToolTip:NSLocalizedString(@"ExtrasSubmenuSongLinkTooltip", nil)];
        [songLinkItem setAction:@selector(convertToSongLink)];
        [songLinkItem setKeyEquivalent:@"C"];
        [self addItem:songLinkItem];
    }

    if (addTranslateOption) {
        NSMenuItem* translateItem = [[NSMenuItem alloc] init];
        [translateItem setTarget:self];
        [translateItem setTitle:NSLocalizedString(@"ExtrasSubmenuTranslate", nil)];
        [translateItem setToolTip:NSLocalizedString(@"ExtrasSubmenuTranslateTooltip", nil)];
        [translateItem setAction:@selector(translate)];
        [translateItem setKeyEquivalent:@"T"];
        [self addItem:translateItem];
    }
}

- (void)menuDidClose:(NSMenu *)menu {
    [self removeAllItems];
}

- (void)convertToSongLink {
    NSString* string = [[NSPasteboard generalPasteboard] stringForType:NSPasteboardTypeString];
    PasteboardItem* item = [[PasteboardItem alloc] initWithContent:string];

    if ([item hasMusicLink]) {
        [[[Environment sharedInstance] pasteboardManager] addSongDotLinkItemFromItem:item];
    }
}

- (void)translate {
    NSString* string = [[NSPasteboard generalPasteboard] stringForType:NSPasteboardTypeString];
    PasteboardItem* item = [[PasteboardItem alloc] initWithContent:string];

    if ([item hasPlainText]) {
        [[[Environment sharedInstance] pasteboardManager] addTranslateItemFromItem:item];
    }
}
@end
