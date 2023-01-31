//
//  AboutPreferenceViewController.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <AppKit/AppKit.h>
#import "SeparatorCell.h"
#import "../Environment.h"
#import "../Utils/CommonUtil.h"

@interface AboutPreferenceViewController : NSViewController
@property(nonatomic, retain)NSImageView* iconImageView;
@property(nonatomic, retain)NSTextField* titleLabel;
@property(nonatomic, retain)SeparatorCell* titleSeparatorCell;
@property(nonatomic, retain)NSTextField* versionLabel;
@property(nonatomic, retain)SeparatorCell* developerSeparatorCell;
@property(nonatomic, retain)NSTextField* developerLabel;
@property(nonatomic, retain)NSTextField* copyrightLabel;
@end
