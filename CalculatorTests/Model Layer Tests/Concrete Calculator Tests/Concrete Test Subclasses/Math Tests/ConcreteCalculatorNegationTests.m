//
//  ConcreteCalculatorNegationTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 6/1/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorAbstractTests.h"

@interface ConcreteCalculatorNegationTests : ConcreteCalculatorAbstractTests

@end

@implementation ConcreteCalculatorNegationTests

- (void)testNegatingSingleDigitZeroDoesNotChangeDisplay {
    [self.inputFeeder enterNumberString:@"0"];
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    [self.calculator negate];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testNegatingMultiDigitZeroDoesNotChangeDisplay {
    [self.inputFeeder enterNumberString:@"0.00000"];
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    [self.calculator negate];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testNegatingPositiveNumberPrependsMinusSignOnDisplay {
    [self.inputFeeder enterNumberString:@"5"];
    [self testNegateCausesDisplayToChangeToString:@"-5"];
}

- (void)testNegatingNegativeNumberRemovesPrependedMinusSignOnDisplay {
    [self enterNegationOfDigitWithoutCallingNegate:5];
    [self testNegateCausesDisplayToChangeToString:@"5"];
}

- (void)testNegatingDoesNotChangeImplicitSecondOperand {
    [self.inputFeeder enterAdditionTerms:@[@"1", @"2"]];
    [self.calculator equals];
    [self.calculator negate];
    // Should result in -3 + 2 (the implicit second operand) = -1
    [self testEqualsProducesExpectedValue:@"-1"];
}

#pragma mark - General Test Cases

- (void)testCase1 {
    [self.inputFeeder enterNumberString:@"385"];
    [self testNegateCausesDisplayToChangeToString:@"-385"];
}

- (void)testCase2 {
    [self.inputFeeder enterNumberString:@"-14.2002"];
    [self testNegateCausesDisplayToChangeToString:@"14.2002"];
}

#pragma mark - Helper

- (void)enterNegationOfDigitWithoutCallingNegate:(NSUInteger)digit {
    [self.calculator minus];
    [self.calculator enterDigit:digit];
    [self.calculator equals];
}

- (void)testNegateCausesDisplayToChangeToString:(NSString *)string {
    XCTestExpectation *expectation = [self.expectationFactory expectationForDisplayToChangeToString:string];
    [self.calculator negate];
    [self waitForExpectations:@[expectation] timeout:0];
}

@end
