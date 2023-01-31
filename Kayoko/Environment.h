//
//  Environment.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Preferences/PreferenceManager.h"
#import "Preferences/PreferenceWindowController.h"
#import "Clipboard History/PasteboardManager.h"

@class AppDelegate;
@class PreferenceManager;
@class PreferenceWindowController;
@class PasteboardManager;

@interface Environment : NSObject
@property(nonatomic, retain)AppDelegate* appDelegate;
@property(nonatomic, retain)PreferenceManager* preferenceLoader;
@property(nonatomic, retain)PreferenceWindowController* preferenceWindowController;
@property(nonatomic, retain)PasteboardManager* pasteboardManager;
+ (instancetype)sharedInstance;
@end
