//
//  DropdownCell.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <AppKit/AppKit.h>

@interface DropdownCell : NSView
@property(nonatomic, retain)NSTextField* label;
@property(nonatomic, retain)NSPopUpButton* dropdown;
- (instancetype)initWithTitle:(NSString *)title andOptions:(NSArray *)options usingTags:(NSArray *)tags withAction:(SEL)action target:(id)target;
- (NSInteger)getSelectedTag;
- (void)selectItemWithTag:(NSInteger)tag;
@end
