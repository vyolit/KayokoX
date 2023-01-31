//
//  ExtrasPreferenceViewController.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <AppKit/AppKit.h>
#import "DescriptionCell.h"
#import "CheckboxCell.h"
#import "SeparatorCell.h"
#import "../Environment.h"

@interface ExtrasPreferenceViewController : NSViewController
@property(nonatomic, retain)CheckboxCell* addSongLinkOptionCell;
@property(nonatomic, retain)DescriptionCell* songLinkDescriptionCell;
@property(nonatomic, retain)SeparatorCell* songLinkSeparatorCell;
@property(nonatomic, retain)CheckboxCell* addTranslateOptionCell;
@property(nonatomic, retain)DescriptionCell* translateDescriptionCell;
@end
