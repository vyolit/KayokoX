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
#import "Clipboard History/PasteboardManager.h"

@class AppDelegate;
@class PreferenceManager;
@class PreferenceWindowController;
@class PasteboardManager;

@interface Environment : NSObject
@property(nonatomic)AppDelegate* appDelegate;
@property(nonatomic)PreferenceManager* preferenceManager;
@property(nonatomic)PreferenceWindowController* preferenceWindowController;
@property(nonatomic)PasteboardManager* pasteboardManager;
+ (instancetype)sharedInstance;
@end
