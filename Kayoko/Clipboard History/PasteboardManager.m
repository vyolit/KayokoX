//
//  PasteboardManager.m
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import "PasteboardManager.h"

@implementation PasteboardManager
- (instancetype)init {
    self = [super init];

    if (self) {
        _observer = [[PasteboardObserver alloc] init];
        _fileManager = [NSFileManager defaultManager];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pasteboardChanged) name:@"PasteboardChanged" object:nil];
    }

    return self;
}

- (void)pasteboardChanged {
    [self ensureResourcesExist];

    for (NSPasteboardItem* item in [[_observer pasteboard] pasteboardItems]) {
        // the order matters
        if ([item dataForType:NSPasteboardTypeFileURL] && [[[Environment sharedInstance] preferenceLoader] saveFiles]) {
            NSData* urlData = [item dataForType:NSPasteboardTypeFileURL];
            NSString* dataString = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
            PasteboardItem* item = [[PasteboardItem alloc] initWithContent:dataString];
            [self addPasteboardItem:item toHistoryWithKey:kHistoryKeyHistory];
        } else if ([item stringForType:NSPasteboardTypeString] && [[[Environment sharedInstance] preferenceLoader] saveText]) {
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
    NSMutableArray* history = json[historyKey] ?: [[NSMutableArray alloc] init];

    [history insertObject:@{
        @"content": [item content] ?: @"",
        @"hasPlainText": @([item hasPlainText]),
        @"hasFile": @([item hasFile]),
        @"hasMusicLink": @([item hasMusicLink]),
        @"hasColor": @([item hasColor])
    } atIndex:0];

    // remove the oldest items if the history contains more items than the set maximum amount
    while ([history count] > [[[Environment sharedInstance] preferenceLoader] maximumHistoryAmount]) {
        [history removeLastObject];
    }

    json[historyKey] = history;

    [self setJsonFromDictionary:json];
}

- (void)addSongDotLinkItemFromItem:(PasteboardItem *)item {
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.song.link/v1-alpha.1/links?url=%@", [item content]]];
    NSURLSessionDataTask* task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData* _Nullable data, NSURLResponse* _Nullable response, NSError* _Nullable error) {
        @try {
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSString* link = json[@"pageUrl"];
            if (link) {
                PasteboardItem* songDotLinkItem = [[PasteboardItem alloc] initWithContent:link];
                [self addPasteboardItem:songDotLinkItem toHistoryWithKey:kHistoryKeyHistory];
                [self updatePasteboardWithItem:songDotLinkItem fromHistoryWithKey:kHistoryKeyHistory shouldAutoPaste:NO];
            } else {
                [CommonUtil showAlertWithTitle:[CommonUtil appName] andMessage:[NSString stringWithFormat:@"%@\n\n%@", NSLocalizedString(@"PasteboardManagerUnexpectedResult", nil), json[@"code"]] withDismissButtonTitle:@"OK"];
            }
        } @catch (NSException* exception) {
            [CommonUtil showAlertWithTitle:[CommonUtil appName] andMessage:[NSString stringWithFormat:@"%@\n\n%@", NSLocalizedString(@"PasteboardManagerSongLinkError", nil), exception] withDismissButtonTitle:@"OK"];
        }
    }];
    [task resume];
}

- (void)addTranslateItemFromItem:(PasteboardItem *)item {
    NSString* encodedString = [[item content] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString* targetLanguageCode = [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.traurige.dev/v1/deepl/translate?text=%@&target_lang=%@", encodedString, targetLanguageCode]];
    NSURLSessionDataTask* task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData* _Nullable data, NSURLResponse* _Nullable response, NSError* _Nullable error) {
        @try {
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSString* translation = json[@"text"];
            if (translation) {
                PasteboardItem* translationItem = [[PasteboardItem alloc] initWithContent:translation];
                [self addPasteboardItem:translationItem toHistoryWithKey:kHistoryKeyHistory];
                [self updatePasteboardWithItem:translationItem fromHistoryWithKey:kHistoryKeyHistory shouldAutoPaste:NO];
            } else {
                [CommonUtil showAlertWithTitle:[CommonUtil appName] andMessage:[NSString stringWithFormat:@"%@\n\n%@", NSLocalizedString(@"PasteboardManagerUnexpectedResult", nil), json[@"message"]] withDismissButtonTitle:@"OK"];
            }
        } @catch (NSException* exception) {
            [CommonUtil showAlertWithTitle:[CommonUtil appName] andMessage:[NSString stringWithFormat:@"%@\n\n%@", NSLocalizedString(@"PasteboardManagerTranslateError", nil), exception] withDismissButtonTitle:@"OK"];
        }
    }];
    [task resume];
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

    if ([[[Environment sharedInstance] preferenceLoader] automaticallyPaste] && shouldAutoPaste) {
        [self simulatePaste];
    }
}

- (NSArray *)itemsFromHistoryWithKey:(NSString *)historyKey {
    NSDictionary* json = [self getJson];
    return json[historyKey] ?: [[NSArray alloc] init];
}

- (NSMutableDictionary *)getJson {
    [self ensureResourcesExist];

    NSData* jsonData = [NSData dataWithContentsOfFile:[self historyPath]];
    NSMutableDictionary* json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];

    return json;
}

- (void)setJsonFromDictionary:(NSMutableDictionary *)dictionary {
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
    [jsonData writeToFile:[self historyPath] atomically:YES];
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
    if (![_fileManager fileExistsAtPath:[[self historyPath] stringByDeletingLastPathComponent] isDirectory:&isDirectory]) {
        [_fileManager createDirectoryAtPath:[[self historyPath] stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];
    }

    if (![_fileManager fileExistsAtPath:[self historyPath]]) {
        NSData* jsonData = [NSJSONSerialization dataWithJSONObject:[[NSMutableDictionary alloc] init] options:NSJSONWritingPrettyPrinted error:nil];
        [jsonData writeToFile:[self historyPath] options:NSDataWritingAtomic error:nil];
    }
}

- (NSString *)historyPath {
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString* appSupportDirectory = [paths objectAtIndex:0];
    return [appSupportDirectory stringByAppendingPathComponent:@"Kayoko/history.plist"];
}
@end
