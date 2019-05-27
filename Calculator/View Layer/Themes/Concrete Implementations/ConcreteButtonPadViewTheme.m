//
//  ConcreteButtonPadViewTheme.m
//  Calculator
//
//  Created by Raheel Merali on 7/2/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteButtonPadViewTheme.h"

#import "ConcreteButtonViewThemeProvider.h"

@interface ConcreteButtonPadViewTheme ()

@property (nonatomic) CGFloat spacing;
@property (nonatomic, readonly) ConcreteButtonViewThemeProvider *concreteButtonViewThemeProvider;

@end

@implementation ConcreteButtonPadViewTheme

- (instancetype)init {
    self = [super init];
    if (self) {
        _concreteButtonViewThemeProvider = [ConcreteButtonViewThemeProvider new];
    }
    return self;
}

#pragma mark - Public

- (void)updateWithTraitCollection:(UITraitCollection *)traitCollection {
    [self updateSpacingWithTraitCollection:traitCollection];
    [self.concreteButtonViewThemeProvider updateWithTraitCollection:traitCollection];
}

#pragma mark - ButtonPadViewTheme

- (NSObject<ButtonViewThemeProviding> *)buttonViewThemeProvider {
    return self.concreteButtonViewThemeProvider;
}

#pragma mark - Spacing

- (void)updateSpacingWithTraitCollection:(UITraitCollection *)traitCollection {
    self.spacing = [self spacingWithTraitCollection:traitCollection];
}

- (CGFloat)spacingWithTraitCollection:(UITraitCollection *)traitCollection {
    if (traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
        return 8;
    }
    
    if (traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular) {
        return 24;
    }
    
    return 8;
}

@end
