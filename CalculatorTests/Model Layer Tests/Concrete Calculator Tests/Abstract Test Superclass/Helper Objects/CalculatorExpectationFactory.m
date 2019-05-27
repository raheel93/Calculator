//
//  CalculatorExpectationFactory.m
//  CalculatorTests
//
//  Created by Raheel Merali on 7/13/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "CalculatorExpectationFactory.h"

#import "Calculator.h"
#import "NSString+CalculatorTestAdditions.h"

@interface CalculatorExpectationFactory ()

@property (nonatomic, readonly) NSObject<Calculator> *calculator;

@end

@implementation CalculatorExpectationFactory

- (instancetype)initWithCalculator:(NSObject<Calculator> *)calculator testCase:(XCTestCase *)testCase {
    self = [super init];
    if (self) {
        _calculator = calculator;
        _testCase = testCase;
    }
    return self;
}

#pragma mark - Display Expectations

- (XCTestExpectation *)expectationForDisplayToChangeToString:(NSString *)text {
    XCTestExpectation *expectation = [self.testCase keyValueObservingExpectationForObject:self.calculator
                                                                                  keyPath:@"display"
                                                                            expectedValue:text];
    expectation.expectationDescription = [NSString stringWithFormat:@"Expect display to change from '%@' to '%@'", self.calculator.display, text];
    return expectation;
}

- (XCTestExpectation *)expectationForDisplayToChange {
    XCTestExpectation *expectation = [self.testCase keyValueObservingExpectationForObject:self.calculator keyPath:@"display" handler:^BOOL(id observedObject, NSDictionary *change) {
        return YES;
    }];
    expectation.expectationDescription = [NSString stringWithFormat:@"Expect display to change from '%@' to anything else", self.calculator.display];
    return expectation;
}

- (XCTestExpectation *)invertedExpectationForDisplayToChange {
    XCTestExpectation *expectation = [self expectationForDisplayToChange];
    expectation.inverted = YES;
    return expectation;
}

- (XCTestExpectation *)expectationForDisplayToMatchRegularExpression:(NSString *)regex {
    XCTestExpectation *expectation = [self.testCase keyValueObservingExpectationForObject:self.calculator keyPath:@"display" handler:^BOOL(id observedObject, NSDictionary *change) {
        NSString *display = [self newValueInChangeDictionary:change];
        return [display calc_matchesRegularExpression:regex];
    }];
    expectation.expectationDescription = [NSString stringWithFormat:@"Expect display to change from '%@' to a value matching the regular expression '%@'", self.calculator.display, regex];
    return expectation;
}

#pragma mark - Localized Display Expectations

- (XCTestExpectation *)expectationForLocalizedDisplayToChangeToString:(NSString *)text {
    XCTestExpectation *expectation = [self.testCase keyValueObservingExpectationForObject:self.calculator
                                                                                  keyPath:@"localizedDisplay"
                                                                            expectedValue:text];
    expectation.expectationDescription = [NSString stringWithFormat:@"Expect localizedDisplay to change from '%@' to '%@'", self.calculator.localizedDisplay, text];
    return expectation;
}

#pragma mark - Private

- (nullable id)newValueInChangeDictionary:(NSDictionary *)change {
    id newValue = change[NSKeyValueChangeNewKey];
    return [newValue isKindOfClass:NSNull.class] ? nil : newValue;
}

@end
