//
//  CFUtil.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "CFUtil.h"

@implementation CFUtil
+ (NSString *)getName {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
}

+ (NSString *)getVersion {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
}
@end
