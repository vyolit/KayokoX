//
//  DropdownCell.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "DropdownCell.h"

@implementation DropdownCell
- (instancetype)initWithTitle:(NSString *)title andOptions:(NSArray *)options usingTags:(NSArray *)tags withAction:(SEL)action target:(id)target {
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
        [self setDropdown:[[NSPopUpButton alloc] init]];
        [[self dropdown] setTarget:target];
        [[self dropdown] setAction:action];
        [[self dropdown] addItemsWithTitles:options];

        for (NSUInteger i = 0; i < [tags count]; i++) {
            [[[self dropdown] itemAtIndex:i] setTag:[tags[i] integerValue]];
        }

        [self addSubview:[self dropdown]];

        [[self dropdown] setTranslatesAutoresizingMaskIntoConstraints:NO];
        [NSLayoutConstraint activateConstraints:@[
            [[[self dropdown] topAnchor] constraintEqualToAnchor:[self topAnchor]],
            [[[self dropdown] leadingAnchor] constraintEqualToAnchor:[[self label] trailingAnchor] constant:8],
            [[[self dropdown] bottomAnchor] constraintEqualToAnchor:[self bottomAnchor]]
        ]];
    }

    return self;
}

- (NSInteger)getSelectedTag {
    return [[[self dropdown] selectedItem] tag];
}

- (void)selectItemWithTag:(NSInteger)tag {
    [[self dropdown] selectItemWithTag:tag];
}
@end
