//
//  ExtrasPreferenceViewController.m
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import "ExtrasPreferenceViewController.h"

@implementation ExtrasPreferenceViewController
- (void)viewDidAppear {
    [super viewDidAppear];
    [[[self view] window] setContentSize:NSSizeFromCGSize(CGSizeMake(430, 175))];
}

- (void)loadView {
    // view
    [self setView:[[NSView alloc] init]];


    // songlink checkbox
    [self setAddSongLinkOptionCell:[[CheckboxCell alloc] initWithTitle:[NSString stringWithFormat:@"%@:", NSLocalizedString(@"ExtrasPreferencesSongLink", nil)] checkboxTitle:NSLocalizedString(@"ExtrasPreferencesSongLinkLabel", nil) action:@selector(setAddSongLinkOption) target:self]];
    [[self view] addSubview:[self addSongLinkOptionCell]];

    [[self addSongLinkOptionCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self addSongLinkOptionCell] topAnchor] constraintEqualToAnchor:[[self view] topAnchor] constant:16],
        [[[self addSongLinkOptionCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self addSongLinkOptionCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];


    // songlink description
    [self setSongLinkDescriptionCell:[[DescriptionCell alloc] initWithTitle:@"" description:NSLocalizedString(@"ExtrasPreferencesSongLinkDescription", nil)]];
    [[self view] addSubview:[self songLinkDescriptionCell]];

    [[self songLinkDescriptionCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self songLinkDescriptionCell] heightAnchor] constraintEqualToConstant:30],
        [[[self songLinkDescriptionCell] topAnchor] constraintEqualToAnchor:[[self addSongLinkOptionCell] bottomAnchor] constant:8],
        [[[self songLinkDescriptionCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self songLinkDescriptionCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];


    // songlink separator
    [self setSongLinkSeparatorCell:[[SeparatorCell alloc] init]];
    [[self view] addSubview:[self songLinkSeparatorCell]];

    [[self songLinkSeparatorCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self songLinkSeparatorCell] topAnchor] constraintEqualToAnchor:[[self songLinkDescriptionCell] bottomAnchor] constant:16],
        [[[self songLinkSeparatorCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self songLinkSeparatorCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];


    // translate checkbox
    [self setAddTranslateOptionCell:[[CheckboxCell alloc] initWithTitle:[NSString stringWithFormat:@"%@:", NSLocalizedString(@"ExtrasPreferencesDeepL", nil)] checkboxTitle:NSLocalizedString(@"ExtrasPreferencesDeepLLabel", nil) action:@selector(setAddTranslateOption) target:self]];
    [[self view] addSubview:[self addTranslateOptionCell]];

    [[self addTranslateOptionCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self addTranslateOptionCell] topAnchor] constraintEqualToAnchor:[[self songLinkSeparatorCell] bottomAnchor] constant:16],
        [[[self addTranslateOptionCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self addTranslateOptionCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];


    // translate description
    [self setTranslateDescriptionCell:[[DescriptionCell alloc] initWithTitle:@"" description:NSLocalizedString(@"ExtrasPreferencesDeepLDescription", nil)]];
    [[self view] addSubview:[self translateDescriptionCell]];

    [[self translateDescriptionCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self translateDescriptionCell] heightAnchor] constraintEqualToConstant:30],
        [[[self translateDescriptionCell] topAnchor] constraintEqualToAnchor:[[self addTranslateOptionCell] bottomAnchor] constant:8],
        [[[self translateDescriptionCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self translateDescriptionCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];

    [self loadPreferences];
}

- (void)setAddSongLinkOption {
    BOOL addSongLinkOption = [[self addSongLinkOptionCell] isOn];
    [[[Environment sharedInstance] preferenceLoader] setPreference:@(addSongLinkOption) forKey:kPreferenceKeyAddSongLinkOption];
    [[[Environment sharedInstance] appDelegate] reloadItems];
}

- (void)setAddTranslateOption {
    BOOL addTranslateOption = [[self addTranslateOptionCell] isOn];
    [[[Environment sharedInstance] preferenceLoader] setPreference:@(addTranslateOption) forKey:kPreferenceKeyAddTranslateOption];
    [[[Environment sharedInstance] appDelegate] reloadItems];
}

- (void)loadPreferences {
    BOOL addSongLinkOption = [[[Environment sharedInstance] preferenceLoader] addSongLinkOption];
    BOOL addTranslateOption = [[[Environment sharedInstance] preferenceLoader] addTranslateOption];

    [[self addSongLinkOptionCell] setOn:addSongLinkOption];
    [[self addTranslateOptionCell] setOn:addTranslateOption];
}
@end
