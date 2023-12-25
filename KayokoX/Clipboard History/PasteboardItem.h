//
//  PasteboardItem.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <Foundation/Foundation.h>

static NSString* const kItemKeyContent = @"content";
static NSString* const kItemKeyHasPlainText = @"has_plain_text";
static NSString* const kItemKeyHasFile = @"has_file";
static NSString* const kItemKeyHasColor = @"has_color";

@interface PasteboardItem : NSObject
@property(nonatomic)NSString* content;
@property(nonatomic, assign)BOOL hasPlainText;
@property(nonatomic, assign)BOOL hasFile;
@property(nonatomic, assign)BOOL hasColor;
- (instancetype)initWithContent:(NSString *)content;
+ (PasteboardItem *)itemFromDictionary:(NSDictionary *)dictionary;
@end
