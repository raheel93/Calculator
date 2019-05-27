//
//  LoggingCalculator.h
//  Calculator
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "Calculator.h"

NS_ASSUME_NONNULL_BEGIN

/**
 A decorator that logs method calls and display changes.
 */
@interface LoggingCalculator : NSObject <Calculator>

- (instancetype)initWithBaseCalculator:(NSObject<Calculator> *)baseCalculator;

@end

@interface LoggingCalculator (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
