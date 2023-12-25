//
//  PasteboardObserver.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <AppKit/AppKit.h>

@interface PasteboardObserver : NSObject {
    NSNotificationCenter* _notificationCenter;
    NSUInteger _lastChangeCount;
}
@property(nonatomic)NSPasteboard* pasteboard;
@end
