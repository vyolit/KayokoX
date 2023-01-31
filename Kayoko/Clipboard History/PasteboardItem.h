//
//  PasteboardItem.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <Foundation/Foundation.h>

@interface PasteboardItem : NSObject
@property(atomic, assign)NSString* content;
@property(atomic, assign)BOOL hasPlainText;
@property(atomic, assign)BOOL hasFile;
@property(atomic, assign)BOOL hasMusicLink;
@property(atomic, assign)BOOL hasColor;
- (instancetype)initWithContent:(NSString *)content;
+ (PasteboardItem *)itemFromDictionary:(NSDictionary *)dictionary;
@end
