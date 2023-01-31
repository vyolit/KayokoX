//
//  PreferenceKeys.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <Foundation/Foundation.h>

static NSString* const kPreferenceKeyStatusItemTitleType = @"StatusItemTitleType";
static NSString* const kPreferenceKeyCustomStatusItemTitle = @"CustomStatusItemTitle";
static NSString* const kPreferenceKeyLaunchAtLogin = @"LaunchAtLogin";
static NSString* const kPreferenceKeyMaximumHistoryAmount = @"MaximumHistoryAmount";
static NSString* const kPreferenceKeySaveText = @"SaveText";
static NSString* const kPreferenceKeySaveFiles = @"SaveFiles";
static NSString* const kPreferenceKeyAutomaticallyPaste = @"AutomaticallyPaste";
static NSString* const kPreferenceKeyAddSongLinkOption = @"addSongLinkOption";
static NSString* const kPreferenceKeyAddTranslateOption = @"addTranslateOption";

static NSUInteger const kStatusItemTitleTypeAppName = 100;
static NSUInteger const kStatusItemTitleTypeIcon = 101;
static NSUInteger const kStatusItemTitleTypeCustomText = 102;

static NSUInteger const kPreferenceKeyStatusItemTitleTypeDefaultValue = kStatusItemTitleTypeAppName;
static NSString* const kPreferenceKeyCustomStatusItemTitleDefaultValue = @"";
static BOOL const kPreferenceKeyLaunchAtLoginDefaultValue = NO;
static NSUInteger const kPreferenceKeyMaximumHistoryAmountDefaultValue = 200;
static BOOL const kPreferenceKeySaveTextDefaultValue = YES;
static BOOL const kPreferenceKeySaveFilesDefaultValue = YES;
static BOOL const kPreferenceKeyAutomaticallyPasteDefaultValue = NO;
static BOOL const kPreferenceKeyAddSongLinkOptionDefaultValue = YES;
static BOOL const kPreferenceKeyAddTranslateOptionDefaultValue = YES;
