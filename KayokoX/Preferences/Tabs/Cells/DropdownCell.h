//
//  DropdownCell.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <AppKit/AppKit.h>

@interface DropdownCell : NSView
@property(nonatomic)NSTextField* label;
@property(nonatomic)NSPopUpButton* dropdown;
- (instancetype)initWithTitle:(NSString *)title andOptions:(NSArray *)options usingTags:(NSArray *)tags withAction:(SEL)action target:(id)target;
- (NSInteger)getSelectedTag;
- (void)selectItemWithTag:(NSInteger)tag;
@end
