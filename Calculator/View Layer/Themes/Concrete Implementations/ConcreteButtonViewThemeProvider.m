//
//  ConcreteButtonViewThemeProvider.m
//  Calculator
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteButtonViewThemeProvider.h"

#import "ConcreteButtonViewTheme.h"

@interface ConcreteButtonViewThemeProvider ()

@property (nonatomic, readonly) NSDictionary<ButtonViewModelStyle, ConcreteButtonViewTheme *> *themesByStyle;

@end

@implementation ConcreteButtonViewThemeProvider

- (instancetype)init {
    self = [super init];
    if (self) {
        _themesByStyle = @{
                           ButtonViewModelStyleDigit: [ConcreteButtonViewTheme digitTheme],
                           ButtonViewModelStyleDigitModifier: [ConcreteButtonViewTheme digitModifierTheme],
                           ButtonViewModelStyleOperator: [ConcreteButtonViewTheme operatorTheme]
                           };
    }
    return self;
}

#pragma mark - Public

- (void)updateWithTraitCollection:(UITraitCollection *)traitCollection {
    for (ConcreteButtonViewTheme *theme in self.themesByStyle.allValues) {
        [theme updateWithTraitCollection:traitCollection];
    }
}

#pragma mark - ButtonViewThemeProviding

- (NSObject<ButtonViewTheme> *)themeForStyle:(ButtonViewModelStyle)style {
    ConcreteButtonViewTheme *theme = self.themesByStyle[style];
    NSAssert(theme, @"No theme defined for style %@", style);
    return theme;
}

@end
