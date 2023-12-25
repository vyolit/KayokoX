//
//  PasteboardManager.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <AppKit/AppKit.h>
#import "PasteboardObserver.h"
#import "PasteboardItem.h"
#import "../../Environment.h"

static NSString* const kHistoryKeyHistory = @"history";
static NSString* const kHistoryKeyFavorites = @"favorites";

@interface PasteboardManager : NSObject {
    PasteboardObserver* _observer;
    NSFileManager* _fileManager;
}
- (void)addPasteboardItem:(PasteboardItem *)item toHistoryWithKey:(NSString *)historyKey;
- (void)updatePasteboardWithItem:(PasteboardItem *)item fromHistoryWithKey:(NSString *)historyKey shouldAutoPaste:(BOOL)shouldAutoPaste;
- (void)removePasteboardItem:(PasteboardItem *)item fromHistoryWithKey:(NSString *)historyKey;
- (NSMutableArray *)getItemsFromHistoryWithKey:(NSString *)historyKey;
- (NSString *)getHistoryPath;
@end
