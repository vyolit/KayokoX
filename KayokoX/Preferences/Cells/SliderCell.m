//
//  SliderCell.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "SliderCell.h"

@implementation SliderCell
- (instancetype)initWithTitle:(NSString *)title minValue:(int)minValue maxValue:(int)maxValue value:(int)value useTickMarks:(BOOL)useTickMarks tickMarksCount:(int)tickMarksCount action:(SEL)action target:(id)target {
    self = [super init];

    if (self) {
        // label
        [self setLabel:[[NSTextField alloc] init]];
        [[self label] setStringValue:title];
        [[self label] setFont:[NSFont systemFontOfSize:13]];
        [[self label] setAlignment:NSTextAlignmentRight];
        [[self label] setBezeled:NO];
        [[self label] setDrawsBackground:NO];
        [[self label] setEditable:NO];
        [[self label] setSelectable:NO];
        [self addSubview:[self label]];

        [[self label] setTranslatesAutoresizingMaskIntoConstraints:NO];
        [NSLayoutConstraint activateConstraints:@[
            [[[self label] widthAnchor] constraintEqualToConstant:110],
            [[[self label] topAnchor] constraintEqualToAnchor:[self topAnchor]],
            [[[self label] leadingAnchor] constraintEqualToAnchor:[self leadingAnchor]],
            [[[self label] bottomAnchor] constraintEqualToAnchor:[self bottomAnchor]]
        ]];


        // dropdown
        [self setSlider:[[NSSlider alloc] init]];
        [[self slider] setTarget:target];
        [[self slider] setMinValue:minValue];
        [[self slider] setMaxValue:maxValue];
        [[self slider] setIntegerValue:value];
        [[self slider] setAllowsTickMarkValuesOnly:useTickMarks];
        [[self slider] setNumberOfTickMarks:tickMarksCount];
        [[self slider] setAction:action];
        [self addSubview:[self slider]];

        [[self slider] setTranslatesAutoresizingMaskIntoConstraints:NO];
        [NSLayoutConstraint activateConstraints:@[
            [[[self slider] widthAnchor] constraintEqualToConstant:150],
            [[[self slider] topAnchor] constraintEqualToAnchor:[self topAnchor]],
            [[[self slider] leadingAnchor] constraintEqualToAnchor:[[self label] trailingAnchor] constant:8],
            [[[self slider] bottomAnchor] constraintEqualToAnchor:[self bottomAnchor]]
        ]];
    }

    return self;
}

- (NSInteger)getValue {
    return [[self slider] integerValue];
}

- (void)setValue:(NSInteger)value {
    [[self slider] setIntegerValue:value];
}
@end
