//
//  AboutPreferenceViewController.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <AppKit/AppKit.h>
#import "SeparatorCell.h"
#import "../../Environment.h"
#import "../../Utils/CFUtil.h"

@interface AboutPreferenceViewController : NSViewController
@property(nonatomic)NSImageView* iconImageView;
@property(nonatomic)NSTextField* titleLabel;
@property(nonatomic)SeparatorCell* titleSeparatorCell;
@property(nonatomic)NSTextField* versionLabel;
@property(nonatomic)SeparatorCell* developerSeparatorCell;
@property(nonatomic)NSTextField* developerLabel;
@property(nonatomic)NSTextField* copyrightLabel;
@end
