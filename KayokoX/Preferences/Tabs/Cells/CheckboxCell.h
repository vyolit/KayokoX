//
//  CheckboxCell.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <AppKit/AppKit.h>

@interface CheckboxCell : NSView
@property(nonatomic)NSTextField* label;
@property(nonatomic)NSButton* checkbox;
- (instancetype)initWithTitle:(NSString *)title checkboxTitle:(NSString *)checkboxTitle action:(SEL)action target:(id)target;
- (BOOL)isOn;
- (void)setOn:(BOOL)on;
@end
