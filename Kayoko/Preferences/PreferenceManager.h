//
//  PreferenceManager.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <Foundation/Foundation.h>
#import "PreferenceKeys.h"

@interface PreferenceManager : NSObject {
    NSUserDefaults* _userDefaults;
}
@property(atomic, assign)NSUInteger statusItemTitleType;
@property(atomic, assign)NSString* customStatusItemTitle;
@property(atomic, assign)BOOL launchAtLogin;
@property(atomic, assign)NSUInteger maximumHistoryAmount;
@property(atomic, assign)BOOL saveText;
@property(atomic, assign)BOOL saveFiles;
@property(atomic, assign)BOOL automaticallyPaste;
@property(atomic, assign)BOOL addSongLinkOption;
@property(atomic, assign)BOOL addTranslateOption;
- (void)setPreference:(id)value forKey:(NSString *)key;
@end
