//
//  ConcreteCalculator.h
//  Calculator
//
//  Created by Raheel Merali on 5/27/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "Calculator.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConcreteCalculator : NSObject <Calculator>

/**
 @param locale The locale in which the display should be localized.
 */
- (instancetype)initWithLocale:(NSLocale *)locale;

@end

NS_ASSUME_NONNULL_END
