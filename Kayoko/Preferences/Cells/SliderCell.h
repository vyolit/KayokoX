//
//  SliderCell.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <AppKit/AppKit.h>

@interface SliderCell : NSView
@property(nonatomic, retain)NSTextField* label;
@property(nonatomic, retain)NSSlider* slider;
- (instancetype)initWithTitle:(NSString *)title minValue:(int)minValue maxValue:(int)maxValue value:(int)value useTickMarks:(BOOL)useTickMarks tickMarksCount:(int)tickMarksCount action:(SEL)action target:(id)target;
- (NSInteger)getValue;
- (void)setValue:(NSInteger)value;
@end
