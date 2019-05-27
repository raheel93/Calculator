//
//  ConcreteCalculatorViewTheme.m
//  Calculator
//
//  Created by Raheel Merali on 7/2/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorViewTheme.h"

#import "ConcreteDisplayViewTheme.h"
#import "ConcreteButtonPadViewTheme.h"

#import <UIKit/UIKit.h>

@interface ConcreteCalculatorViewTheme ()

@property (nonatomic, readonly) ConcreteDisplayViewTheme *concreteDisplayViewTheme;
@property (nonatomic, readonly) ConcreteButtonPadViewTheme *concreteButtonPadViewTheme;

@end

@implementation ConcreteCalculatorViewTheme

- (instancetype)init {
    self = [super init];
    if (self) {
        _concreteDisplayViewTheme = [ConcreteDisplayViewTheme new];
        _concreteButtonPadViewTheme = [ConcreteButtonPadViewTheme new];
    }
    return self;
}

#pragma mark - Public

- (void)updateWithTraitCollection:(UITraitCollection *)traitCollection {
    [self.concreteDisplayViewTheme updateWithTraitCollection:traitCollection];
    [self.concreteButtonPadViewTheme updateWithTraitCollection:traitCollection];
}

#pragma mark - CalculatorViewTheme

+ (NSSet<NSString *> *)keyPathsForValuesAffectingMargins {
    return [NSSet setWithObject:@"buttonPadViewTheme.spacing"];
}

- (NSDirectionalEdgeInsets)margins {
    CGFloat spacing = self.buttonPadViewTheme.spacing;
    return NSDirectionalEdgeInsetsMake(spacing, spacing, spacing, spacing);
}

- (UIColor *)backgroundColor {
    return UIColor.blackColor;
}

- (NSObject<DisplayViewTheme> *)displayViewTheme {
    return self.concreteDisplayViewTheme;
}

- (NSObject<ButtonPadViewTheme> *)buttonPadViewTheme {
    return self.concreteButtonPadViewTheme;
}

@end
