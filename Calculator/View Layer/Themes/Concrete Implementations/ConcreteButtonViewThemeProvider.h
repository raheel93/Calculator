//
//  ConcreteButtonViewThemeProvider.h
//  Calculator
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ButtonViewThemeProviding.h"

@class UITraitCollection;

NS_ASSUME_NONNULL_BEGIN

@interface ConcreteButtonViewThemeProvider : NSObject <ButtonViewThemeProviding>

- (void)updateWithTraitCollection:(UITraitCollection *)traitCollection;

@end

NS_ASSUME_NONNULL_END
