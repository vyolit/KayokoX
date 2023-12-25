//
//  PreferenceManager.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <Foundation/Foundation.h>
#import "PreferenceKeys.h"

@interface PreferenceManager : NSObject {
    NSUserDefaults* _userDefaults;
}
@property(nonatomic, assign)NSUInteger statusItemTitleType;
@property(nonatomic)NSString* customStatusItemTitle;
@property(nonatomic, assign)BOOL launchAtLogin;
@property(nonatomic, assign)NSUInteger maximumHistoryAmount;
@property(nonatomic, assign)BOOL saveText;
@property(nonatomic, assign)BOOL saveFiles;
@property(nonatomic, assign)BOOL automaticallyPaste;
- (void)setPreference:(id)value forKey:(NSString *)key;
@end
