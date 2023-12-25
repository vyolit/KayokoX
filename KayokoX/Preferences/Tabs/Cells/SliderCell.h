//
//  SliderCell.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <AppKit/AppKit.h>

@interface SliderCell : NSView
@property(nonatomic)NSTextField* label;
@property(nonatomic)NSSlider* slider;
- (instancetype)initWithTitle:(NSString *)title minValue:(int)minValue maxValue:(int)maxValue value:(int)value useTickMarks:(BOOL)useTickMarks tickMarksCount:(int)tickMarksCount action:(SEL)action target:(id)target;
- (NSInteger)getValue;
- (void)setValue:(NSInteger)value;
@end
