//
//  Environment.m
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import "Environment.h"

@implementation Environment
+ (instancetype)sharedInstance {
    static Environment* sharedInstance;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [Environment alloc];
    });

    return sharedInstance;
}

- (instancetype)init {
    return [Environment sharedInstance];
}
@end
