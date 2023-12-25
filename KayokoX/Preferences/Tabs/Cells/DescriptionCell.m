//
//  DescriptionCell.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "DescriptionCell.h"

@implementation DescriptionCell
- (instancetype)initWithTitle:(NSString *)title description:(NSString *)description {
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
        [self setDescriptionLabel:[[NSTextField alloc] init]];
        [[self descriptionLabel] setStringValue:description];
        [[self descriptionLabel] setFont:[NSFont systemFontOfSize:11]];
        [[self descriptionLabel] setTextColor:[NSColor systemGrayColor]];
        [[self descriptionLabel] setBezeled:NO];
        [[self descriptionLabel] setDrawsBackground:NO];
        [[self descriptionLabel] setEditable:NO];
        [[self descriptionLabel] setSelectable:NO];
        [self addSubview:[self descriptionLabel]];

        [[self descriptionLabel] setTranslatesAutoresizingMaskIntoConstraints:NO];
        [NSLayoutConstraint activateConstraints:@[
            [[[self descriptionLabel] topAnchor] constraintEqualToAnchor:[self topAnchor]],
            [[[self descriptionLabel] leadingAnchor] constraintEqualToAnchor:[[self label] trailingAnchor] constant:8],
            [[[self descriptionLabel] trailingAnchor] constraintEqualToAnchor:[self trailingAnchor]],
            [[[self descriptionLabel] bottomAnchor] constraintEqualToAnchor:[self bottomAnchor]]
        ]];
    }

    return self;
}

- (void)setDescription:(NSString *)description {
    [[self descriptionLabel] setStringValue:description];
}
@end
