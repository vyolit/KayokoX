//
//  PreferenceManager.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "PreferenceManager.h"

@implementation PreferenceManager
- (instancetype)init {
    self = [super init];

    if (self) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
        [self reloadPreferences];
    }

    return self;
}

- (void)reloadPreferences {
    [_userDefaults registerDefaults:@{
        kPreferenceKeyStatusItemTitleType: @(kPreferenceKeyStatusItemTitleTypeDefaultValue),
        kPreferenceKeyCustomStatusItemTitle: kPreferenceKeyCustomStatusItemTitleDefaultValue,
        kPreferenceKeyLaunchAtLogin: @(kPreferenceKeyLaunchAtLoginDefaultValue),
        kPreferenceKeyMaximumHistoryAmount: @(kPreferenceKeyMaximumHistoryAmountDefaultValue),
        kPreferenceKeySaveText: @(kPreferenceKeySaveTextDefaultValue),
        kPreferenceKeySaveFiles: @(kPreferenceKeySaveFilesDefaultValue),
        kPreferenceKeyAutomaticallyPaste: @(kPreferenceKeyAutomaticallyPasteDefaultValue)
    }];

    [self setStatusItemTitleType:[[_userDefaults objectForKey:kPreferenceKeyStatusItemTitleType] unsignedIntValue]];
    [self setCustomStatusItemTitle:[_userDefaults objectForKey:kPreferenceKeyCustomStatusItemTitle]];
    [self setLaunchAtLogin:[[_userDefaults objectForKey:kPreferenceKeyLaunchAtLogin] boolValue]];
    [self setMaximumHistoryAmount:[[_userDefaults objectForKey:kPreferenceKeyMaximumHistoryAmount] unsignedIntValue]];
    [self setSaveText:[[_userDefaults objectForKey:kPreferenceKeySaveText] boolValue]];
    [self setSaveFiles:[[_userDefaults objectForKey:kPreferenceKeySaveFiles] boolValue]];
    [self setAutomaticallyPaste:[[_userDefaults objectForKey:kPreferenceKeyAutomaticallyPaste] boolValue]];
}

- (void)setPreference:(id)value forKey:(NSString *)key {
    [_userDefaults setObject:value forKey:key];
    [self reloadPreferences];
}

@end
