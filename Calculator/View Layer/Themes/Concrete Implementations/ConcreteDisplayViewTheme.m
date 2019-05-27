//
//  ConcreteDisplayViewTheme.m
//  Calculator
//
//  Created by Raheel Merali on 7/2/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteDisplayViewTheme.h"

@interface ConcreteDisplayViewTheme ()

@property (nonatomic) UIFont *font;

@end

@implementation ConcreteDisplayViewTheme

#pragma mark - Public

- (void)updateWithTraitCollection:(UITraitCollection *)traitCollection {
    [self updateFontWithTraitCollection:traitCollection];
}

#pragma mark - DisplayViewTheme

- (UIColor *)textColor {
    return UIColor.whiteColor;
}

- (UIColor *)backgroundColor {
    return UIColor.blackColor;
}

- (CGFloat)fontMinimumScaleFactor {
    return 0.3;
}

#pragma mark - Font

- (void)updateFontWithTraitCollection:(UITraitCollection *)traitCollection {
    self.font = [UIFont systemFontOfSize:[self fontSizeWithTraitCollection:traitCollection]];
}

- (CGFloat)fontSizeWithTraitCollection:(UITraitCollection *)traitCollection {
    if (traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
        return 64;
    }
    
    if (traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular) {
        return 144;
    }
    
    return 84;
}

@end
