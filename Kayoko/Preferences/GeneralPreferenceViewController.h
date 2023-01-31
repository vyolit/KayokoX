//
//  GeneralPreferenceViewController.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <AppKit/AppKit.h>
#import "Cells/DropdownCell.h"
#import "Cells/TextFieldCell.h"
#import "Cells/DescriptionCell.h"
#import "Cells/SeparatorCell.h"
#import "Cells/CheckboxCell.h"
#import "../Environment.h"
#import "ServiceManagement/ServiceManagement.h"
#import "../Utils/CommonUtil.h"

@interface GeneralPreferenceViewController : NSViewController <NSTextFieldDelegate>
@property(nonatomic, retain)DropdownCell* iconCell;
@property(nonatomic, retain)TextFieldCell* iconCustomTextCell;
@property(nonatomic, retain)DescriptionCell* iconCustomTextDescriptionCell;
@property(nonatomic, retain)SeparatorCell* iconSeparatorCell;
@property(nonatomic, retain)CheckboxCell* launchAtLoginCell;
@end
