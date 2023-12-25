//
//  PasteboardHistoryWindowController.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <AppKit/AppKit.h>
#import "PasteboardHistoryViewController.h"

@interface PasteboardHistoryWindowController : NSWindowController {
    BOOL _hasCenteredWindow;
}
- (void)show;
@end
