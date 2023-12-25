//
//  AboutPreferenceViewController.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "AboutPreferenceViewController.h"

@implementation AboutPreferenceViewController
- (void)viewDidAppear {
    [super viewDidAppear];
    [[[self view] window] setContentSize:NSSizeFromCGSize(CGSizeMake(430, 210))];
}

- (void)loadView {
    // view
    [self setView:[[NSView alloc] init]];


    // icon image view
    [self setIconImageView:[[NSImageView alloc] init]];
    NSImage* appIcon = [NSImage imageNamed:[[NSBundle mainBundle] infoDictionary][@"CFBundleIconFile"]];
    [[self iconImageView] setImage:appIcon];
    [[self view] addSubview:[self iconImageView]];

    [[self iconImageView] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self iconImageView] widthAnchor] constraintEqualToConstant:100],
        [[[self iconImageView] heightAnchor] constraintEqualToConstant:100],
        [[[self iconImageView] topAnchor] constraintEqualToAnchor:[[self view] topAnchor] constant:24],
        [[[self iconImageView] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:32]
    ]];


    // title label
    [self setTitleLabel:[[NSTextField alloc] init]];
    [[self titleLabel] setStringValue:[CFUtil getName]];
    [[self titleLabel] setFont:[NSFont systemFontOfSize:19]];
    [[self titleLabel] setBezeled:NO];
    [[self titleLabel] setDrawsBackground:NO];
    [[self titleLabel] setEditable:NO];
    [[self titleLabel] setSelectable:NO];
    [[self view] addSubview:[self titleLabel]];

    [[self titleLabel] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self titleLabel] topAnchor] constraintEqualToAnchor:[[self view] topAnchor] constant:32],
        [[[self titleLabel] leadingAnchor] constraintEqualToAnchor:[[self iconImageView] trailingAnchor] constant:32],
        [[[self titleLabel] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-32]
    ]];


    // title separator
    [self setTitleSeparatorCell:[[SeparatorCell alloc] init]];
    [[self view] addSubview:[self titleSeparatorCell]];

    [[self titleSeparatorCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self titleSeparatorCell] topAnchor] constraintEqualToAnchor:[[self titleLabel] bottomAnchor] constant:16],
        [[[self titleSeparatorCell] leadingAnchor] constraintEqualToAnchor:[[self iconImageView] trailingAnchor] constant:32],
        [[[self titleSeparatorCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-32]
    ]];


    // version label
    [self setVersionLabel:[[NSTextField alloc] init]];
    [[self versionLabel] setStringValue:[NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"AboutPreferencesVersion", nil), [CFUtil getVersion]]];
    [[self versionLabel] setFont:[NSFont systemFontOfSize:14]];
    [[self versionLabel] setBezeled:NO];
    [[self versionLabel] setDrawsBackground:NO];
    [[self versionLabel] setEditable:NO];
    [[self versionLabel] setSelectable:NO];
    [[self versionLabel] setAlphaValue:0.6];
    [[self view] addSubview:[self versionLabel]];

    [[self versionLabel] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self versionLabel] topAnchor] constraintEqualToAnchor:[[self titleSeparatorCell] bottomAnchor] constant:16],
        [[[self versionLabel] leadingAnchor] constraintEqualToAnchor:[[self iconImageView] trailingAnchor] constant:32],
        [[[self versionLabel] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-32]
    ]];


    // developer label
    [self setDeveloperLabel:[[NSTextField alloc] init]];
    [[self developerLabel] setStringValue:NSLocalizedString(@"AboutPreferencesGitHub", nil)];
    [[self developerLabel] setFont:[NSFont systemFontOfSize:14 weight:NSFontWeightMedium]];
    [[self developerLabel] setBezeled:NO];
    [[self developerLabel] setDrawsBackground:NO];
    [[self developerLabel] setEditable:NO];
    [[self developerLabel] setSelectable:NO];
    [[self view] addSubview:[self developerLabel]];

    [[self developerLabel] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self developerLabel] topAnchor] constraintEqualToAnchor:[[self versionLabel] bottomAnchor] constant:8],
        [[[self developerLabel] leadingAnchor] constraintEqualToAnchor:[[self iconImageView] trailingAnchor] constant:32],
        [[[self developerLabel] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-32]
    ]];


    // developer separator
    [self setDeveloperSeparatorCell:[[SeparatorCell alloc] init]];
    [[self view] addSubview:[self developerSeparatorCell]];

    [[self developerSeparatorCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self developerSeparatorCell] topAnchor] constraintEqualToAnchor:[[self developerLabel] bottomAnchor] constant:16],
        [[[self developerSeparatorCell] leadingAnchor] constraintEqualToAnchor:[[self iconImageView] trailingAnchor] constant:32],
        [[[self developerSeparatorCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-32]
    ]];


    // copyright label
    [self setCopyrightLabel:[[NSTextField alloc] init]];

    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy"];
    NSString* year = [dateFormatter stringFromDate:[NSDate date]];

    [[self copyrightLabel] setStringValue:[NSString stringWithFormat:@"© %@ %@", year, NSLocalizedString(@"AboutPreferencesCopyright", nil)]];
    [[self copyrightLabel] setFont:[NSFont systemFontOfSize:12]];
    [[self copyrightLabel] setBezeled:NO];
    [[self copyrightLabel] setDrawsBackground:NO];
    [[self copyrightLabel] setEditable:NO];
    [[self copyrightLabel] setSelectable:NO];
    [[self view] addSubview:[self copyrightLabel]];

    [[self copyrightLabel] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self copyrightLabel] topAnchor] constraintEqualToAnchor:[[self developerSeparatorCell] bottomAnchor] constant:16],
        [[[self copyrightLabel] leadingAnchor] constraintEqualToAnchor:[[self iconImageView] trailingAnchor] constant:32],
        [[[self copyrightLabel] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-32]
    ]];
}
@end
