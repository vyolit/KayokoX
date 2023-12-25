//
//  CheckboxCell.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "CheckboxCell.h"

@implementation CheckboxCell
- (instancetype)initWithTitle:(NSString *)title checkboxTitle:(NSString *)checkboxTitle action:(SEL)action target:(id)target {
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


        // checkbox
        [self setCheckbox:[[NSButton alloc] init]];
        [[self checkbox] setTarget:target];
        [[self checkbox] setAction:action];
        [[self checkbox] setButtonType:NSButtonTypeSwitch];
        [[self checkbox] setTitle:checkboxTitle];
        [[self checkbox] setFont:[NSFont systemFontOfSize:13]];
        [self addSubview:[self checkbox]];

        [[self checkbox] setTranslatesAutoresizingMaskIntoConstraints:NO];
        [NSLayoutConstraint activateConstraints:@[
            [[[self checkbox] topAnchor] constraintEqualToAnchor:[self topAnchor]],
            [[[self checkbox] leadingAnchor] constraintEqualToAnchor:[[self label] trailingAnchor] constant:8],
            [[[self checkbox] trailingAnchor] constraintEqualToAnchor:[self trailingAnchor]],
            [[[self checkbox] bottomAnchor] constraintEqualToAnchor:[self bottomAnchor]]
        ]];
    }

    return self;
}

- (BOOL)isOn {
    return [[self checkbox] state] == NSControlStateValueOn;
}

- (void)setOn:(BOOL)on {
    [[self checkbox] setState:on ? NSControlStateValueOn : NSControlStateValueOff];
}
@end
