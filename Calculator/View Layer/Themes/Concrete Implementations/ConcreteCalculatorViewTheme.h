//
//  ConcreteCalculatorViewTheme.h
//  Calculator
//
//  Created by Raheel Merali on 7/2/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "CalculatorViewTheme.h"

@class UITraitCollection;

NS_ASSUME_NONNULL_BEGIN

@interface ConcreteCalculatorViewTheme : NSObject <CalculatorViewTheme>

- (void)updateWithTraitCollection:(UITraitCollection *)traitCollection;

@end

NS_ASSUME_NONNULL_END
