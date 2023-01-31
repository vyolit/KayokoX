//
//  CheckboxCell.m
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <AppKit/AppKit.h>

@interface CheckboxCell : NSView
@property(nonatomic, retain)NSTextField* label;
@property(nonatomic, retain)NSButton* checkbox;
- (instancetype)initWithTitle:(NSString *)title checkboxTitle:(NSString *)checkboxTitle action:(SEL)action target:(id)target;
- (BOOL)isOn;
- (void)setOn:(BOOL)on;
@end
