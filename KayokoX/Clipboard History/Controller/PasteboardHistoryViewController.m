//
//  PasteboardHistoryViewController.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import "PasteboardHistoryViewController.h"

@implementation PasteboardHistoryViewController
/**
 * {inheritdoc}
 */
- (void)viewDidAppear {
    [super viewDidAppear];
    [[[self view] window] setContentSize:NSSizeFromCGSize(CGSizeMake(600, 400))];
}

- (void)loadView {
    [self setView:[[NSView alloc] init]];
}
@end
