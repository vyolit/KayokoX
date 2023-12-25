//
//  PreferenceKeys.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <Foundation/Foundation.h>

static NSString* const kPreferenceKeyStatusItemTitleType = @"StatusItemTitleType";
static NSString* const kPreferenceKeyCustomStatusItemTitle = @"CustomStatusItemTitle";
static NSString* const kPreferenceKeyLaunchAtLogin = @"LaunchAtLogin";
static NSString* const kPreferenceKeyMaximumHistoryAmount = @"MaximumHistoryAmount";
static NSString* const kPreferenceKeySaveText = @"SaveText";
static NSString* const kPreferenceKeySaveFiles = @"SaveFiles";
static NSString* const kPreferenceKeyAutomaticallyPaste = @"AutomaticallyPaste";

static NSUInteger const kStatusItemTitleTypeIcon = 100;
static NSUInteger const kStatusItemTitleTypeCustomText = 101;

static NSUInteger const kPreferenceKeyStatusItemTitleTypeDefaultValue = kStatusItemTitleTypeIcon;
static NSString* const kPreferenceKeyCustomStatusItemTitleDefaultValue = @"";
static BOOL const kPreferenceKeyLaunchAtLoginDefaultValue = NO;
static NSUInteger const kPreferenceKeyMaximumHistoryAmountDefaultValue = 200;
static BOOL const kPreferenceKeySaveTextDefaultValue = YES;
static BOOL const kPreferenceKeySaveFilesDefaultValue = YES;
static BOOL const kPreferenceKeyAutomaticallyPasteDefaultValue = NO;
