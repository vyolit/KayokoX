//
//  PasteboardItem.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "PasteboardItem.h"

@implementation PasteboardItem
- (instancetype)initWithContent:(NSString *)content {
    self = [super init];

    if (self) {
        [self setContent:content];
        [self setHasFile:[content hasPrefix:@"file://"]];
        [self setHasColor:[self contentHasColor:content] && ![self hasFile]];
        [self setHasPlainText:![self hasFile] && ![self hasColor]];
    }

    return self;
}

+ (PasteboardItem *)itemFromDictionary:(NSDictionary *)dictionary {
    return [[PasteboardItem alloc] initWithContent:dictionary[kItemKeyContent]];
}

- (BOOL)contentHasColor:(NSString *)content {
    NSString* hexRegex = @"^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$";
    NSString* rgbRegex = @"^rgb\\(\\s*([0-9]{1,3})\\s*,\\s*([0-9]{1,3})\\s*,\\s*([0-9]{1,3})\\s*\\)$";
    NSString* rgbaRegex = @"^rgba\\(\\s*([0-9]{1,3})\\s*,\\s*([0-9]{1,3})\\s*,\\s*([0-9]{1,3})\\s*,\\s*([0-9]{1,3}|[0-9]{1,3}\\.[0-9]{1,3})\\s*\\)$";
    NSArray* regexes = @[hexRegex, rgbRegex, rgbaRegex];

    for (NSString* regex in regexes) {
        NSRegularExpression* expression = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:nil];
        if ([expression firstMatchInString:content options:0 range:NSMakeRange(0, [content length])]) {
            return YES;
        }
    }

    return NO;
}
@end
