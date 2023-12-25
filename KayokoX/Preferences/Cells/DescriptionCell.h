//
//  DescriptionCell.h
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <AppKit/AppKit.h>

@interface DescriptionCell : NSView
@property(nonatomic)NSTextField* label;
@property(nonatomic)NSTextField* descriptionLabel;
- (instancetype)initWithTitle:(NSString *)title description:(NSString *)description;
- (void)setDescription:(NSString *)description;
@end
