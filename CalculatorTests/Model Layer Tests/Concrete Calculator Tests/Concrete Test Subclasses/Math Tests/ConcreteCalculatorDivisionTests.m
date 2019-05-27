//
//  ConcreteCalculatorDivisionTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 6/1/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorAbstractTests.h"

@interface ConcreteCalculatorDivisionTests : ConcreteCalculatorAbstractTests

@end

@implementation ConcreteCalculatorDivisionTests

- (void)testCase1 {
    [self testDividingTerms:@[@"8", @"2"]
           producesQuotient:@"4"];
}

- (void)testCase2 {
    [self.inputFeeder enterDivisionTerms:@[@"1", @"3"]];
    [self testEqualsProducesValueMatchingRegularExpression:@"0\\.3+"];
}

- (void)testCase3 {
    [self testDividingTerms:@[@"100", @"0.1"]
           producesQuotient:@"1000"];
}

- (void)testCase4 {
    [self testDividingTerms:@[@"1000", @"10", @"5", @"1"]
           producesQuotient:@"20"];
}

#pragma mark - Other

- (void)testOverActsLikeEqualsAfterTwoTermsEntered {
    [self.inputFeeder enterAdditionTerms:@[@"3", @"4"]];
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"7"];
    [self.calculator over];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testOverAfterACalculationDoesNotChangeDisplay {
    // Perform any old calculation.
    [self.inputFeeder enterAdditionTerms:@[@"3", @"-6"]];
    [self.calculator equals];
    
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    [self.calculator over];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

#pragma mark - Error Cases

- (void)testDividingByZeroProducesError {
    [self enterDivisionByZero];
    [self testEqualsProducesExpectedValue:self.constants.errorText];
}

- (void)testOverflowingQuotientProducesError {
    [self testDividingTerms:@[self.constants.largestSupportedInteger, @"0.5"]
           producesQuotient:self.constants.errorText];
}

- (void)testUnderflowingQuotientProducesError {
    [self testDividingTerms:@[self.constants.smallestSupportedInteger, @"0.5"]
           producesQuotient:self.constants.errorText];
}

- (void)testDividingByErrorProducesError {
    // Produce an error
    [self enterDivisionByZero];
    [self.calculator equals];
    
    [self.calculator over];
    [self.inputFeeder enterNumberString:@"5"];
    [self testEqualsProducesExpectedValue:self.constants.errorText];
}

#pragma mark - Repeated Invocations of Equals

- (void)testSecondInvocationOfEqualsProducesQuotientByDividingByLastEnteredTerm {
    [self.inputFeeder enterDivisionTerms:@[@"40", @"2"]];
    [self.calculator equals];
    [self testEqualsProducesExpectedValue:@"10"];
}

- (void)testThirdInvocationOfEqualsProducesQuotientByDividingByLastEnteredTerm {
    [self.inputFeeder enterDivisionTerms:@[@"40", @"2"]];
    [self.calculator equals];
    [self.calculator equals];
    [self testEqualsProducesExpectedValue:@"5"];
}

#pragma mark - Repeated Invocations of Over

- (void)testRepeatedInvocationsOfOverHaveNoEffectOnDisplay {
    [self.inputFeeder enterNumberString:@"5"];
    [self.calculator over];
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    [self.calculator over];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testRepeatedInvocationsOfOverDoNotAffectQuotient {
    [self.inputFeeder enterNumberString:@"5"];
    [self.calculator over];
    [self.calculator over];
    [self testDividingTerms:@[@"2"] producesQuotient:@"2.5"];
}

#pragma mark - Helper Methods

- (void)enterDivisionByZero {
    [self.inputFeeder enterNumberString:@"12"];
    [self.calculator over];
    [self.inputFeeder enterNumberString:@"0"];
}

- (void)testDividingTerms:(NSArray<NSString *> *)terms producesQuotient:(NSString *)expectedQuotient {
    [self.inputFeeder enterDivisionTerms:terms];
    [self testEqualsProducesExpectedValue:expectedQuotient];
}

@end
