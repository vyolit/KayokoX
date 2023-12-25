//
//  AppDelegate.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <Cocoa/Cocoa.h>
#import "Environment.h"
#import "Clipboard History/Menu/PasteboardHistoryMenu.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSStatusItem* _statusItem;
}
- (void)reloadItems;
- (void)updateStatusIconUsingIcon:(BOOL)icon andTitle:(NSString *)title;
@end
