//
//  ClipboardPreferenceViewController.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <AppKit/AppKit.h>
#import "SliderCell.h"
#import "DescriptionCell.h"
#import "CheckboxCell.h"
#import "SeparatorCell.h"
#import "../Environment.h"

@interface ClipboardPreferenceViewController : NSViewController
@property(nonatomic, retain)SliderCell* maximumHistoryAmountSliderCell;
@property(nonatomic, retain)DescriptionCell* historySizeDescriptionCell;
@property(nonatomic, retain)CheckboxCell* saveTextCell;
@property(nonatomic, retain)CheckboxCell* saveFilesCell;
@property(nonatomic, retain)SeparatorCell* saveSeparatorCell;
@property(nonatomic, retain)CheckboxCell* automaticallyPasteCell;
@end
