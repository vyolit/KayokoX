//
//  TextFieldCell.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <AppKit/AppKit.h>

@interface TextFieldCell : NSView
@property(nonatomic)NSTextField* label;
@property(nonatomic)NSTextField* textField;
- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder target:(id)target;
- (NSString *)getText;
- (void)setText:(NSString *)text;
- (void)setEnabled:(BOOL)enabled;
@end
