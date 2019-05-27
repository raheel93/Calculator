//
//  HighlightingButton.m
//  Calculator
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "HighlightingButton.h"

@interface HighlightingButton ()

@property (nonatomic) UIColor *originalBackgroundColor;

@end

@implementation HighlightingButton

#pragma mark - UIView overrides

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.originalBackgroundColor = backgroundColor;
    [self updateSuperBackgroundColor];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self updateSuperBackgroundColor];
}

#pragma mark - Private

- (UIColor *)highlightColor {
    CGFloat red, green, blue, alpha;
    BOOL didGetComponents = [self.originalBackgroundColor getRed:&red
                                                           green:&green
                                                            blue:&blue
                                                           alpha:&alpha];
    if (!didGetComponents) {
        return self.originalBackgroundColor;
    }
    
    CGFloat percentage = 0.6;
    return [UIColor colorWithRed:red * percentage
                           green:green * percentage
                            blue:blue * percentage
                           alpha:alpha];
}

- (void)updateSuperBackgroundColor {
    super.backgroundColor = self.highlighted ? self.highlightColor : self.originalBackgroundColor;
}

@end
