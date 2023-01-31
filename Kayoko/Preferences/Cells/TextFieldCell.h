//
//  TextFieldCell.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <AppKit/AppKit.h>

@interface TextFieldCell : NSView
@property(nonatomic, retain)NSTextField* label;
@property(nonatomic, retain)NSTextField* textField;
- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder target:(id)target;
- (NSString *)getText;
- (void)setText:(NSString *)text;
- (void)setEnabled:(BOOL)enabled;
@end
