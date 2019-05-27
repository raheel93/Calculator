//
//  ConcreteCalculatorAbstractTests.h
//  CalculatorTests
//
//  Created by Raheel Merali on 5/28/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculator.h"
#import "ConcreteCalculatorTestConstants.h"
#import "CalculatorInputFeeder.h"
#import "CalculatorExpectationFactory.h"

#import <XCTest/XCTest.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConcreteCalculatorAbstractTests : XCTestCase

@property (nonatomic, readonly) ConcreteCalculator *calculator;
@property (nonatomic, readonly) ConcreteCalculatorTestConstants *constants;
@property (nonatomic, readonly) CalculatorInputFeeder *inputFeeder;
@property (nonatomic, readonly) CalculatorExpectationFactory *expectationFactory;

- (void)testEqualsProducesExpectedValue:(NSString *)expectedValue;
- (void)testEqualsProducesValueMatchingRegularExpression:(NSString *)regex;

@end

@interface ConcreteCalculatorAbstractTests (Subclassing)

/**
 Subclasses can override this method to customize the Calculator used for the tests.
 */
- (ConcreteCalculator *)makeCalculator;

@end

NS_ASSUME_NONNULL_END
