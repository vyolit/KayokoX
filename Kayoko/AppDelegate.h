//
//  AppDelegate.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <Cocoa/Cocoa.h>
#import "Clipboard History/PasteboardHistoryMenu.h"
#import "Extras/ExtrasMenu.h"
#import "Environment.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSStatusItem* _statusItem;
}
- (void)reloadItems;
- (void)updateStatusIconUsingIcon:(BOOL)icon andTitle:(NSString *)title;
@end
