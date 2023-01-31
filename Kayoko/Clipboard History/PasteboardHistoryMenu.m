//
//  PasteboardHistoryMenu.m
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import "PasteboardHistoryMenu.h"

@implementation PasteboardHistoryMenu
- (instancetype)initWithTitle:(NSString *)title {
    self = [super initWithTitle:title];

    if (self) {
        [self setDelegate:self];
    }

    return self;
}

- (void)menuWillOpen:(NSMenu *)menu {
    NSArray* favoriteItems = [[[Environment sharedInstance] pasteboardManager] itemsFromHistoryWithKey:kHistoryKeyFavorites];
    NSArray* historyItems = [[[Environment sharedInstance] pasteboardManager] itemsFromHistoryWithKey:kHistoryKeyHistory];

    if ([favoriteItems count] > 0) {
        NSMenuItem* favoriteItem = [[NSMenuItem alloc] init];
        [favoriteItem setTitle:NSLocalizedString(@"HistorySubmenuFavorites", nil)];
        [favoriteItem setEnabled:NO];
        [self addItem:favoriteItem];

        NSUInteger itemIndex = 1;
        for (NSDictionary* dictionary in favoriteItems) {
            PasteboardItem* item = [PasteboardItem itemFromDictionary:dictionary];

            NSMenuItem* menuItem = [[NSMenuItem alloc] init];
            [menuItem setTarget:self];
            [menuItem setTitle:[item content]];
            [menuItem setToolTip:[item content]];
            [menuItem setAction:@selector(selectedFavoriteItem:)];

            if (itemIndex <= 9) {
                [menuItem setKeyEquivalent:[NSString stringWithFormat:@"%lu", itemIndex]];
                [menuItem setKeyEquivalentModifierMask:NSEventModifierFlagCommand];
                itemIndex++;
            }

            [self addItem:menuItem];
        }
    }

    if ([historyItems count] > 0) {
        NSMenuItem* historyItem = [[NSMenuItem alloc] init];
        [historyItem setTitle:NSLocalizedString(@"HistorySubmenuHistory", nil)];
        [historyItem setEnabled:NO];
        [self addItem:historyItem];

        NSUInteger itemIndex = 1;
        for (NSDictionary* dictionary in historyItems) {
            PasteboardItem* item = [PasteboardItem itemFromDictionary:dictionary];

            NSMenuItem* menuItem = [[NSMenuItem alloc] init];
            [menuItem setTarget:self];
            [menuItem setTitle:[item content]];
            [menuItem setToolTip:[item content]];
            [menuItem setAction:@selector(selectedHistoryItem:)];

            if (itemIndex <= 9) {
                [menuItem setKeyEquivalent:[NSString stringWithFormat:@"%lu", itemIndex]];
                itemIndex++;
            }

            [self addItem:menuItem];
        }
        
        [self addItem:[NSMenuItem separatorItem]];
        
        NSMenuItem* clearHistoryItem = [[NSMenuItem alloc] init];
        [clearHistoryItem setTarget:self];
        [clearHistoryItem setTitle:NSLocalizedString(@"HistorySubmenuClearHistory", nil)];
        [clearHistoryItem setAction:@selector(clearHistory)];
        [self addItem:clearHistoryItem];
    }
    
    if ([favoriteItems count] == 0 && [historyItems count] == 0) {
        NSMenuItem* placeholderItem = [[NSMenuItem alloc] init];
        [placeholderItem setTitle:NSLocalizedString(@"HistorySubmenuPlaceholder", nil)];
        [placeholderItem setEnabled:NO];
        [self addItem:placeholderItem];
    }
}

- (void)menuDidClose:(NSMenu *)menu {
    [self removeAllItems];
}

- (void)selectedFavoriteItem:(NSMenuItem *)menuItem {
    PasteboardItem* item = [[PasteboardItem alloc] initWithContent:[menuItem title]];
    [[[Environment sharedInstance] pasteboardManager] updatePasteboardWithItem:item fromHistoryWithKey:kHistoryKeyFavorites shouldAutoPaste:YES];
}

- (void)selectedHistoryItem:(NSMenuItem *)menuItem {
    PasteboardItem* item = [[PasteboardItem alloc] initWithContent:[menuItem title]];
    [[[Environment sharedInstance] pasteboardManager] updatePasteboardWithItem:item fromHistoryWithKey:kHistoryKeyHistory shouldAutoPaste:YES];
}

- (void)clearHistory {
    NSArray* historyItems = [[[Environment sharedInstance] pasteboardManager] itemsFromHistoryWithKey:kHistoryKeyHistory];
    for (NSDictionary* dictionary in historyItems) {
        PasteboardItem* item = [PasteboardItem itemFromDictionary:dictionary];
        [[[Environment sharedInstance] pasteboardManager] removePasteboardItem:item fromHistoryWithKey:kHistoryKeyHistory];
    }
}
@end
