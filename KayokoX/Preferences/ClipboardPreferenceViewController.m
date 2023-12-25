//
//  ClipboardPreferenceViewController.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "ClipboardPreferenceViewController.h"

@implementation ClipboardPreferenceViewController
- (void)viewDidAppear {
    [super viewDidAppear];
    [[[self view] window] setContentSize:NSSizeFromCGSize(CGSizeMake(430, 200))];
}

- (void)loadView {
    // view
    [self setView:[[NSView alloc] init]];


    // history size slider
    [self setMaximumHistoryAmountSliderCell:[[SliderCell alloc] initWithTitle:[NSString stringWithFormat:@"%@:", NSLocalizedString(@"ClipboardPreferencesMaximumAmount", nil)] minValue:50 maxValue:500 value:200 useTickMarks:YES tickMarksCount:10 action:@selector(setHistorySize) target:self]];
    [[self view] addSubview:[self maximumHistoryAmountSliderCell]];

    [[self maximumHistoryAmountSliderCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self maximumHistoryAmountSliderCell] topAnchor] constraintEqualToAnchor:[[self view] topAnchor] constant:16],
        [[[self maximumHistoryAmountSliderCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self maximumHistoryAmountSliderCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];


    // history size description
    [self setHistorySizeDescriptionCell:[[DescriptionCell alloc] initWithTitle:@"" description:@""]];
    [[self view] addSubview:[self historySizeDescriptionCell]];

    [[self historySizeDescriptionCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self historySizeDescriptionCell] heightAnchor] constraintEqualToConstant:30],
        [[[self historySizeDescriptionCell] topAnchor] constraintEqualToAnchor:[[self maximumHistoryAmountSliderCell] bottomAnchor] constant:8],
        [[[self historySizeDescriptionCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self historySizeDescriptionCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];


    // save text checkbox
    [self setSaveTextCell:[[CheckboxCell alloc] initWithTitle:[NSString stringWithFormat:@"%@:", NSLocalizedString(@"ClipboardPreferencesSave", nil)] checkboxTitle:NSLocalizedString(@"ClipboardPreferencesSaveText", nil) action:@selector(setSaveText) target:self]];
    [[self view] addSubview:[self saveTextCell]];

    [[self saveTextCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self saveTextCell] topAnchor] constraintEqualToAnchor:[[self historySizeDescriptionCell] bottomAnchor] constant:16],
        [[[self saveTextCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self saveTextCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];


    // save images checkbox
    [self setSaveFilesCell:[[CheckboxCell alloc] initWithTitle:@"" checkboxTitle:NSLocalizedString(@"ClipboardPreferencesSaveFiles", nil) action:@selector(setSaveFiles) target:self]];
    [[self view] addSubview:[self saveFilesCell]];

    [[self saveFilesCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self saveFilesCell] topAnchor] constraintEqualToAnchor:[[self saveTextCell] bottomAnchor] constant:8],
        [[[self saveFilesCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self saveFilesCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];


    // save separator
    [self setSaveSeparatorCell:[[SeparatorCell alloc] init]];
    [[self view] addSubview:[self saveSeparatorCell]];

    [[self saveSeparatorCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self saveSeparatorCell] topAnchor] constraintEqualToAnchor:[[self saveFilesCell] bottomAnchor] constant:16],
        [[[self saveSeparatorCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self saveSeparatorCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];


    // automatically paste checkbox
    [self setAutomaticallyPasteCell:[[CheckboxCell alloc] initWithTitle:[NSString stringWithFormat:@"%@:", NSLocalizedString(@"ClipboardPreferencesBehavior", nil)] checkboxTitle:NSLocalizedString(@"ClipboardPreferencesBehaviorAutomaticallyPaste", nil) action:@selector(setAutomaticallyPaste) target:self]];
    [[self view] addSubview:[self automaticallyPasteCell]];

    [[self automaticallyPasteCell] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [[[self automaticallyPasteCell] topAnchor] constraintEqualToAnchor:[[self saveSeparatorCell] bottomAnchor] constant:16],
        [[[self automaticallyPasteCell] leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor] constant:40],
        [[[self automaticallyPasteCell] trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor] constant:-40]
    ]];

    [self loadPreferences];
}

- (void)setHistorySize {
    NSUInteger historySize = [[self maximumHistoryAmountSliderCell] getValue];
    [[[Environment sharedInstance] preferenceManager] setPreference:@(historySize) forKey:kPreferenceKeyMaximumHistoryAmount];
    [self setHistorySizeDescription:historySize];
}

- (void)setHistorySizeDescription:(NSUInteger)historySize {
    [[self historySizeDescriptionCell] setDescription:[NSString stringWithFormat:@"%@ %li.", NSLocalizedString(@"ClipboardPreferencesMaximumAmountDescription", nil), historySize]];
}

- (void)setSaveText {
    BOOL saveText = [[self saveTextCell] isOn];
    [[[Environment sharedInstance] preferenceManager] setPreference:@(saveText) forKey:kPreferenceKeySaveText];
}

- (void)setSaveFiles {
    BOOL saveFiles = [[self saveFilesCell] isOn];
    [[[Environment sharedInstance] preferenceManager] setPreference:@(saveFiles) forKey:kPreferenceKeySaveFiles];
}

- (void)setAutomaticallyPaste {
    BOOL automaticallyPaste = [[self automaticallyPasteCell] isOn];
    [[[Environment sharedInstance] preferenceManager] setPreference:@(automaticallyPaste) forKey:kPreferenceKeyAutomaticallyPaste];
}

- (void)loadPreferences {
    NSUInteger historySize = [[[Environment sharedInstance] preferenceManager] maximumHistoryAmount];
    BOOL saveText = [[[Environment sharedInstance] preferenceManager] saveText];
    BOOL saveFiles = [[[Environment sharedInstance] preferenceManager] saveFiles];
    BOOL automaticallyPaste = [[[Environment sharedInstance] preferenceManager] automaticallyPaste];

    [[self maximumHistoryAmountSliderCell] setValue:historySize];
    [self setHistorySizeDescription:historySize];
    [[self saveTextCell] setOn:saveText];
    [[self saveFilesCell] setOn:saveFiles];
    [[self automaticallyPasteCell] setOn:automaticallyPaste];
}
@end
