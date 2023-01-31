//
//  DescriptionCell.h
//  Kayoko
//
//  Created by Alexandra Aurora Göttlicher (@Traurige)
//

#import <AppKit/AppKit.h>

@interface DescriptionCell : NSView
@property(nonatomic, retain)NSTextField* label;
@property(nonatomic, retain)NSTextField* descriptionLabel;
- (instancetype)initWithTitle:(NSString *)title description:(NSString *)description;
- (void)setDescription:(NSString *)description;
@end
