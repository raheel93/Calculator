//
//  ConcreteCalculatorAbstractTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 5/28/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorAbstractTests.h"

#import "ConcreteCalculator.h"
#import "CalculatorInputFeeder.h"
#import "CalculatorExpectationFactory.h"

@implementation ConcreteCalculatorAbstractTests

#pragma mark - Public

@synthesize calculator = _calculator;

- (ConcreteCalculator *)calculator {
    if (!_calculator) {
        _calculator = [self makeCalculator];
    }
    return _calculator;
}

@synthesize constants = _constants;

- (ConcreteCalculatorTestConstants *)constants {
    if (!_constants) {
        _constants = [ConcreteCalculatorTestConstants new];
    }
    return _constants;
}

@synthesize inputFeeder = _inputFeeder;

- (CalculatorInputFeeder *)inputFeeder {
    if (!_inputFeeder) {
        _inputFeeder = [[CalculatorInputFeeder alloc] initWithCalculator:self.calculator];
    }
    return _inputFeeder;
}

@synthesize expectationFactory = _expectationFactory;

- (CalculatorExpectationFactory *)expectationFactory {
    if (!_expectationFactory) {
        _expectationFactory = [[CalculatorExpectationFactory alloc] initWithCalculator:self.calculator
                                                                              testCase:self];
    }
    return _expectationFactory;
}

- (void)testEqualsProducesExpectedValue:(NSString *)expectedValue {
    XCTestExpectation *expectation = [self.expectationFactory expectationForDisplayToChangeToString:expectedValue];
    [self.calculator equals];
    [self waitForExpectations:@[expectation] timeout:0];
}

- (void)testEqualsProducesValueMatchingRegularExpression:(NSString *)regex {
    XCTestExpectation *expectation = [self.expectationFactory expectationForDisplayToMatchRegularExpression:regex];
    [self.calculator equals];
    [self waitForExpectations:@[expectation] timeout:0];
}

#pragma mark - XCTestCase overrides

- (void)performTest:(XCTestRun *)run {
    // This class is abstract, so the tests within it should not be run.
    if (self.class == ConcreteCalculatorAbstractTests.class) {
        return;
    }
    [super performTest:run];
}

#pragma mark - Subclassing

- (ConcreteCalculator *)makeCalculator {
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    return [[ConcreteCalculator alloc] initWithLocale:locale];
}

@end
