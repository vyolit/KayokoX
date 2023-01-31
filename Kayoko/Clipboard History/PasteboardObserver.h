//
//  PasteboardObserver.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <AppKit/AppKit.h>

@interface PasteboardObserver : NSObject {
    NSUInteger _lastChangeCount;
}
@property(nonatomic, retain)NSPasteboard* pasteboard;
@end
