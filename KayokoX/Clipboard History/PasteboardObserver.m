//
//  PasteboardObserver.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "PasteboardObserver.h"

@implementation PasteboardObserver
- (instancetype)init {
    self = [super init];

    if (self) {
        _notificationCenter = [NSNotificationCenter defaultCenter];
        [self setPasteboard:[NSPasteboard generalPasteboard]];
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(checkPasteboard) userInfo:nil repeats:YES];
    }

    return self;
}

- (void)checkPasteboard {
    if ([[self pasteboard] changeCount] == _lastChangeCount) {
        return;
    }

    [_notificationCenter postNotificationName:@"PasteboardChanged" object:nil];
    _lastChangeCount = [[self pasteboard] changeCount];
}
@end
