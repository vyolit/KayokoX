//
//  PasteboardManager.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "PasteboardManager.h"

@implementation PasteboardManager
- (instancetype)init {
    self = [super init];

    if (self) {
        _observer = [[PasteboardObserver alloc] init];
        _fileManager = [NSFileManager defaultManager];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pullPasteboardChanges) name:@"PasteboardChanged" object:nil];
    }

    return self;
}

- (void)pullPasteboardChanges {
    [self ensureResourcesExist];

    for (NSPasteboardItem* item in [[_observer pasteboard] pasteboardItems]) {
        // the order matters
        if ([item dataForType:NSPasteboardTypeFileURL] && [[[Environment sharedInstance] preferenceManager] saveFiles]) {
            NSData* urlData = [item dataForType:NSPasteboardTypeFileURL];
            NSString* dataString = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
            PasteboardItem* item = [[PasteboardItem alloc] initWithContent:dataString];
            [self addPasteboardItem:item toHistoryWithKey:kHistoryKeyHistory];
        } else if ([item stringForType:NSPasteboardTypeString] && [[[Environment sharedInstance] preferenceManager] saveText]) {
            NSString* stringContent = [item stringForType:NSPasteboardTypeString];
            PasteboardItem* item = [[PasteboardItem alloc] initWithContent:stringContent];
            [self addPasteboardItem:item toHistoryWithKey:kHistoryKeyHistory];
        }
    }
}

- (void)addPasteboardItem:(PasteboardItem *)item toHistoryWithKey:(NSString *)historyKey {
    if ([[item content] isEqualToString:@""]) {
        return;
    }

    // remove duplicates
    [self removePasteboardItem:item fromHistoryWithKey:historyKey];

    NSMutableDictionary* json = [self getJson];
    NSMutableArray* history = [self getItemsFromHistoryWithKey:historyKey];

    [history insertObject:@{
        kItemKeyContent: [item content] ?: @"",
        kItemKeyHasPlainText: @([item hasPlainText]),
        kItemKeyHasFile: @([item hasFile]),
        kItemKeyHasColor: @([item hasColor])
    } atIndex:0];

    // remove the oldest items if the history contains more items than the set maximum amount
    while ([history count] > [[[Environment sharedInstance] preferenceManager] maximumHistoryAmount]) {
        [history removeLastObject];
    }

    json[historyKey] = history;

    [self setJsonFromDictionary:json];
}

- (void)removePasteboardItem:(PasteboardItem *)item fromHistoryWithKey:(NSString *)historyKey {
    NSMutableDictionary* json = [self getJson];
    NSMutableArray* history = json[historyKey];

    for (NSDictionary* dictionary in history) {
        PasteboardItem* historyItem = [PasteboardItem itemFromDictionary:dictionary];
        if ([[historyItem content] isEqualToString:[item content]]) {
            [history removeObject:dictionary];
            break;
        }
    }

    json[historyKey] = history;

    [self setJsonFromDictionary:json];
}

- (void)updatePasteboardWithItem:(PasteboardItem *)item fromHistoryWithKey:(NSString *)historyKey shouldAutoPaste:(BOOL)shouldAutoPaste {
    NSPasteboard* pasteboard = [NSPasteboard generalPasteboard];
    [pasteboard declareTypes:@[NSPasteboardTypeString, NSPasteboardTypeURL, NSPasteboardTypeFileURL] owner:nil];

    [pasteboard setString:[item content] forType:NSPasteboardTypeString];

    if ([item hasFile]) {
        [pasteboard setString:[item content] forType:NSPasteboardTypeFileURL];
    }

    // remove the given item and add it again to the front
    [self removePasteboardItem:item fromHistoryWithKey:historyKey];
    [self addPasteboardItem:item toHistoryWithKey:historyKey];

    if ([[[Environment sharedInstance] preferenceManager] automaticallyPaste] && shouldAutoPaste) {
        [self simulatePaste];
    }
}

- (NSMutableArray *)getItemsFromHistoryWithKey:(NSString *)historyKey {
    NSDictionary* json = [self getJson];
    return json[historyKey] ?: [[NSMutableArray alloc] init];
}

- (NSMutableDictionary *)getJson {
    [self ensureResourcesExist];

    NSData* jsonData = [NSData dataWithContentsOfFile:[self getHistoryPath]];
    NSMutableDictionary* json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];

    return json;
}

- (void)setJsonFromDictionary:(NSMutableDictionary *)dictionary {
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
    [jsonData writeToFile:[self getHistoryPath] atomically:YES];
}

- (void)simulatePaste {
    CGEventSourceRef source = CGEventSourceCreate(kCGEventSourceStateHIDSystemState);
    CGEventRef cmdDown = CGEventCreateKeyboardEvent(source, (CGKeyCode)55, true);
    CGEventRef cmdUp = CGEventCreateKeyboardEvent(source, (CGKeyCode)55, false);
    CGEventRef vDown = CGEventCreateKeyboardEvent(source, (CGKeyCode)9, true);
    CGEventRef vUp = CGEventCreateKeyboardEvent(source, (CGKeyCode)9, false);

    CGEventTapLocation loc = kCGHIDEventTap;
    CGEventSetFlags(cmdDown, kCGEventFlagMaskCommand);
    CGEventSetFlags(cmdUp, kCGEventFlagMaskCommand);
    CGEventSetFlags(vDown, kCGEventFlagMaskCommand);
    CGEventSetFlags(vUp, kCGEventFlagMaskCommand);

    CGEventPost(loc, cmdDown);
    CGEventPost(loc, vDown);
    CGEventPost(loc, cmdUp);
    CGEventPost(loc, vUp);
}

- (void)ensureResourcesExist {
    BOOL isDirectory;
    if (![_fileManager fileExistsAtPath:[[self getHistoryPath] stringByDeletingLastPathComponent] isDirectory:&isDirectory]) {
        [_fileManager createDirectoryAtPath:[[self getHistoryPath] stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];
    }

    if (![_fileManager fileExistsAtPath:[self getHistoryPath]]) {
        NSData* jsonData = [NSJSONSerialization dataWithJSONObject:[[NSMutableDictionary alloc] init] options:NSJSONWritingPrettyPrinted error:nil];
        [jsonData writeToFile:[self getHistoryPath] options:NSDataWritingAtomic error:nil];
    }
}

- (NSString *)getHistoryPath {
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString* appSupportDirectory = [paths objectAtIndex:0];
    return [appSupportDirectory stringByAppendingPathComponent:@"KayokoX/history.plist"];
}
@end
