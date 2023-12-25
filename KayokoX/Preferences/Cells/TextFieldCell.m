//
//  TextFieldCell.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "TextFieldCell.h"

@implementation TextFieldCell
- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder target:(id)target {
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


        // text field
        [self setTextField:[[NSTextField alloc] init]];
        [[self textField] setDelegate:target];
        [[self textField] setTarget:target];
        [[self textField] setPlaceholderString:placeholder];
        [[self textField] setFont:[NSFont systemFontOfSize:13]];
        [self addSubview:[self textField]];

        [[self textField] setTranslatesAutoresizingMaskIntoConstraints:NO];
        [NSLayoutConstraint activateConstraints:@[
            [[[self textField] topAnchor] constraintEqualToAnchor:[self topAnchor]],
            [[[self textField] leadingAnchor] constraintEqualToAnchor:[[self label] trailingAnchor] constant:8],
            [[[self textField] trailingAnchor] constraintEqualToAnchor:[self trailingAnchor]],
            [[[self textField] bottomAnchor] constraintEqualToAnchor:[self bottomAnchor]]
        ]];
    }

    return self;
}

- (NSString *)getText {
    return [[self textField] stringValue];
}

- (void)setText:(NSString *)text {
    [[self textField] setStringValue:text];
}

- (void)setEnabled:(BOOL)enabled {
    [[self textField] setEnabled:enabled];
}
@end
