//
//  GeneralPreferenceViewController.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <AppKit/AppKit.h>
#import "Cells/DropdownCell.h"
#import "Cells/TextFieldCell.h"
#import "Cells/DescriptionCell.h"
#import "Cells/SeparatorCell.h"
#import "Cells/CheckboxCell.h"
#import "../../Environment.h"
#import "ServiceManagement/ServiceManagement.h"
#import "../../Utils/AlertUtil.h"

@interface GeneralPreferenceViewController : NSViewController <NSTextFieldDelegate>
@property(nonatomic)DropdownCell* iconCell;
@property(nonatomic)TextFieldCell* iconCustomTextCell;
@property(nonatomic)DescriptionCell* iconCustomTextDescriptionCell;
@property(nonatomic)SeparatorCell* iconSeparatorCell;
@property(nonatomic)CheckboxCell* launchAtLoginCell;
@end
