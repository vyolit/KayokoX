//
//  GeneralPreferenceViewController.m
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import "GeneralPreferenceViewController.h"

@implementation GeneralPreferenceViewController
- (void)viewDidAppear {
    [super viewDidAppear];
    [[[self view] window] setContentSize:NSSizeFromCGSize(CGSizeMake(430, 170))];
}

- (void)loadView {
    // view
    [self setView:[[NSView alloc] init]];


    // icon
    [self setIconCell:[[DropdownCell alloc] initWithTitle:[NSString stringWithFormat:@"%@:", NSLocalizedString(@"GeneralPreferencesIcon", nil)] andOptions:@[NSLocalizedString(@"GeneralPreferencesIconAppName", nil), NSLocalizedString(@"GeneralPreferencesIconIcon", nil), NSLocalizedString(@"GeneralPreferencesIconCustomText", nil)] usingTags:@[@(kStatusItemTitleTypeAppName), @(kStatusItemTitleTypeIcon), @(kStatusItemTitleTypeCustomText)] withAction:@selector(setIcon) target:self]];
    [[self view] addSubview:[self iconCell]];

    [[self iconCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self iconCell] heightAnchor] constraintEqualToConstant:20],
        [[[self iconCell] topAnchor] constraintEqualToAnchor:[[self view] topAnchor] constant:16],
        [[[self iconCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self iconCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];


    // icon custom text
    [self setIconCustomTextCell:[[TextFieldCell alloc] initWithTitle:@"" placeholder:NSLocalizedString(@"GeneralPreferencesIconCustomText", nil) target:self]];
    [[self view] addSubview:[self iconCustomTextCell]];

    [[self iconCustomTextCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self iconCustomTextCell] heightAnchor] constraintEqualToConstant:20],
        [[[self iconCustomTextCell] topAnchor] constraintEqualToAnchor:[[self iconCell] bottomAnchor] constant:8],
        [[[self iconCustomTextCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self iconCustomTextCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];


    // icon custom text description
    [self setIconCustomTextDescriptionCell:[[DescriptionCell alloc] initWithTitle:@"" description:[NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"GeneralPreferencesIconDescription", nil), [CommonUtil appName]]]];
    [[self view] addSubview:[self iconCustomTextDescriptionCell]];

    [[self iconCustomTextDescriptionCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self iconCustomTextDescriptionCell] heightAnchor] constraintEqualToConstant:30],
        [[[self iconCustomTextDescriptionCell] topAnchor] constraintEqualToAnchor:[[self iconCustomTextCell] bottomAnchor] constant:8],
        [[[self iconCustomTextDescriptionCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self iconCustomTextDescriptionCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];


    // icon separator
    [self setIconSeparatorCell:[[SeparatorCell alloc] init]];
    [[self view] addSubview:[self iconSeparatorCell]];

    [[self iconSeparatorCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self iconSeparatorCell] topAnchor] constraintEqualToAnchor:[[self iconCustomTextDescriptionCell] bottomAnchor] constant:16],
        [[[self iconSeparatorCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self iconSeparatorCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];


    // launch at login checkbox
    [self setLaunchAtLoginCell:[[CheckboxCell alloc] initWithTitle:[NSString stringWithFormat:@"%@:", NSLocalizedString(@"GeneralPreferencesStartup", nil)] checkboxTitle:NSLocalizedString(@"GeneralPreferencesStartupLabel", nil) action:@selector(setLaunchAtLogin) target:self]];
    [[self view] addSubview:[self launchAtLoginCell]];

    [[self launchAtLoginCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self launchAtLoginCell] topAnchor] constraintEqualToAnchor:[[self iconSeparatorCell] bottomAnchor] constant:16],
        [[[self launchAtLoginCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self launchAtLoginCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];

    [self loadPreferences];
}

- (void)setIcon {
    NSInteger type = [[self iconCell] getSelectedTag];
    [[[Environment sharedInstance] preferenceLoader] setPreference:@(type) forKey:kPreferenceKeyStatusItemTitleType];

    if (type == kStatusItemTitleTypeAppName) {
        [[[Environment sharedInstance] appDelegate] updateStatusIconUsingIcon:NO andTitle:@""];
        [[[self iconCustomTextCell] textField] setEnabled:NO];
    } else if (type == kStatusItemTitleTypeIcon) {
        [[[Environment sharedInstance] appDelegate] updateStatusIconUsingIcon:YES andTitle:@""];
        [[[self iconCustomTextCell] textField] setEnabled:NO];
    } else if (type == kStatusItemTitleTypeCustomText) {
        NSString* customText = [[[self iconCustomTextCell] textField] stringValue];
        if (![customText isEqualToString:@""]) {
            [[[Environment sharedInstance] appDelegate] updateStatusIconUsingIcon:NO andTitle:customText];
        }
        [[[self iconCustomTextCell] textField] setEnabled:YES];
    }
}

- (void)controlTextDidEndEditing:(NSNotification *)obj {
    NSString* customText = [[self iconCustomTextCell] getText];
    [[[Environment sharedInstance] preferenceLoader] setPreference:customText forKey:kPreferenceKeyCustomStatusItemTitle];
    [[[Environment sharedInstance] appDelegate] updateStatusIconUsingIcon:NO andTitle:customText];
}

- (void)setLaunchAtLogin {
    BOOL launchAtLogin = [[self launchAtLoginCell] isOn];
    [[[Environment sharedInstance] preferenceLoader] setPreference:@(launchAtLogin) forKey:kPreferenceKeyLaunchAtLogin];
    SMLoginItemSetEnabled((__bridge CFStringRef)@"dev.traurige.KayokoAutoLauncher", (Boolean)launchAtLogin);
}

- (void)loadPreferences {
    NSUInteger statusItemTitleType = [[[Environment sharedInstance] preferenceLoader] statusItemTitleType];
    NSString* customStatusItemTitle = [[[Environment sharedInstance] preferenceLoader] customStatusItemTitle];
    BOOL launchAtLogin = [[[Environment sharedInstance] preferenceLoader] launchAtLogin];

    [[self iconCell] selectItemWithTag:statusItemTitleType];
    [[self iconCustomTextCell] setText:customStatusItemTitle];
    [[self iconCustomTextCell] setEnabled:statusItemTitleType == kStatusItemTitleTypeCustomText];
    [[self launchAtLoginCell] setOn:launchAtLogin];
}
@end
