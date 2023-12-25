//
//  ClipboardPreferenceViewController.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <AppKit/AppKit.h>
#import "SliderCell.h"
#import "DescriptionCell.h"
#import "CheckboxCell.h"
#import "SeparatorCell.h"
#import "../../Environment.h"

@interface ClipboardPreferenceViewController : NSViewController
@property(nonatomic)SliderCell* maximumHistoryAmountSliderCell;
@property(nonatomic)DescriptionCell* historySizeDescriptionCell;
@property(nonatomic)CheckboxCell* saveTextCell;
@property(nonatomic)CheckboxCell* saveFilesCell;
@property(nonatomic)SeparatorCell* saveSeparatorCell;
@property(nonatomic)CheckboxCell* automaticallyPasteCell;
@end
