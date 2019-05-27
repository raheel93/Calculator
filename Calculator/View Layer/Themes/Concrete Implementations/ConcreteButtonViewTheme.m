//
//  ConcreteButtonViewTheme.m
//  Calculator
//
//  Created by Raheel Merali on 7/2/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteButtonViewTheme.h"

#import <UIKit/UIKit.h>

@interface ConcreteButtonViewTheme ()

@property (nonatomic, readonly) CGFloat fontScaleFactor;
@property (nonatomic) UIFont *font;

@end

@implementation ConcreteButtonViewTheme

+ (instancetype)operatorTheme {
    return [[self alloc] initWithBackgroundColor:UIColor.orangeColor
                                       textColor:UIColor.whiteColor
                                 fontScaleFactor:1.2];
}

+ (instancetype)digitTheme {
    return [[self alloc] initWithBackgroundColor:UIColor.darkGrayColor
                                       textColor:UIColor.whiteColor
                                 fontScaleFactor:1];
}

+ (instancetype)digitModifierTheme {
    return [[self alloc] initWithBackgroundColor:UIColor.lightGrayColor
                                       textColor:UIColor.blackColor
                                 fontScaleFactor:1];
}

@synthesize backgroundColor = _backgroundColor;
@synthesize textColor = _textColor;

- (instancetype)initWithBackgroundColor:(UIColor *)backgroundColor
                              textColor:(UIColor *)textColor
                        fontScaleFactor:(CGFloat)fontScaleFactor {
    self = [super init];
    if (self) {
        _backgroundColor = backgroundColor;
        _textColor = textColor;
        _fontScaleFactor = fontScaleFactor;
    }
    return self;
}

#pragma mark - Public

- (void)updateWithTraitCollection:(UITraitCollection *)traitCollection {
    [self updateFontWithTraitCollection:traitCollection];
}

#pragma mark - Private

- (void)updateFontWithTraitCollection:(UITraitCollection *)traitCollection {
    CGFloat fontSize = [self fontSizeForTraitCollection:traitCollection] * self.fontScaleFactor;
    self.font = [UIFont systemFontOfSize:fontSize];
}

- (CGFloat)fontSizeForTraitCollection:(UITraitCollection *)traitCollection {
    if (traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
        return 36;
    }
    
    if (traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular) {
        return 66;
    }
    
    return 36;
}

@end
