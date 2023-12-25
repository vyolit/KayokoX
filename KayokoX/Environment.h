//
//  Environment.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Preferences/PreferenceManager.h"
#import "Preferences/PreferenceWindowController.h"
#import "Clipboard History/Manager/PasteboardManager.h"
#import "Clipboard History/Controller/PasteboardHistoryWindowController.h"

@class AppDelegate;
@class PreferenceManager;
@class PasteboardManager;
@class PreferenceWindowController;
@class PasteboardHistoryWindowController;

@interface Environment : NSObject
@property(nonatomic)AppDelegate* appDelegate;
@property(nonatomic)PreferenceManager* preferenceManager;
@property(nonatomic)PasteboardManager* pasteboardManager;
@property(nonatomic)PreferenceWindowController* preferenceWindowController;
@property(nonatomic)PasteboardHistoryWindowController* pasteboardHistoryWindowController;
+ (instancetype)sharedInstance;
@end
