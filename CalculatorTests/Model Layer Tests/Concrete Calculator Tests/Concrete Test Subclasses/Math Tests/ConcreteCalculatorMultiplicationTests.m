//
//  ConcreteCalculatorMultiplicationTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 6/1/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorAbstractTests.h"

@interface ConcreteCalculatorMultiplicationTests : ConcreteCalculatorAbstractTests

@end

@implementation ConcreteCalculatorMultiplicationTests

- (void)testCase1 {
    [self testMultiplyingTerms:@[@"3", @"9"]
               producesProduct:@"27"];
}

- (void)testCase2 {
    [self testMultiplyingTerms:@[@"10", @"0.33333"]
               producesProduct:@"3.3333"];
}

- (void)testCase3 {
    [self testMultiplyingTerms:@[@"30", @"0.5", @"900", @"6"]
               producesProduct:@"81000"];
}

- (void)testCase4 {
    [self testMultiplyingTerms:@[@"100", @"1"]
               producesProduct:@"100"];
}

- (void)testCase5 {
    [self testMultiplyingTerms:@[@"0", @"3"]
               producesProduct:@"0"];
}

#pragma mark - Other

- (void)testTimesActsLikeEqualsAfterTwoTermsEntered {
    [self.inputFeeder enterAdditionTerms:@[@"3", @"4"]];
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"7"];
    [self.calculator times];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testTimesAfterACalculationDoesNotChangeDisplay {
    // Perform any old calculation.
    [self.inputFeeder enterAdditionTerms:@[@"3", @"-6"]];
    [self.calculator equals];
    
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    [self.calculator times];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

#pragma mark - Error Cases

- (void)testOverflowingProductProducesError {
    [self testMultiplyingTerms:@[self.constants.largestSupportedInteger, @"2"]
               producesProduct:self.constants.errorText];
}

- (void)testUnderflowingProductProducesError {
    [self testMultiplyingTerms:@[self.constants.smallestSupportedInteger, @"2"]
               producesProduct:self.constants.errorText];
}

- (void)testMultiplyingErrorProducesError {
    // Introduce error
    [self.inputFeeder enterMultiplicationTerms:@[self.constants.largestSupportedInteger,
                                                 self.constants.largestSupportedInteger]];
    [self.calculator equals];
    
    // Multiply the error
    [self.calculator times];
    [self.inputFeeder enterNumberString:@"5"];
    [self testEqualsProducesExpectedValue:self.constants.errorText];
}

#pragma mark - Repeated Invocations of Equals

- (void)testSecondInvocationOfEqualsProducesProductByMultiplyingByLastEnteredTerm {
    [self.inputFeeder enterMultiplicationTerms:@[@"5", @"3"]];
    [self.calculator equals];
    [self testEqualsProducesExpectedValue:@"45"];
}

- (void)testThirdInvocationOfEqualsProducesProductByMultiplyingByLastEnteredTerm {
    [self.inputFeeder enterMultiplicationTerms:@[@"5", @"3"]];
    [self.calculator equals];
    [self.calculator equals];
    [self testEqualsProducesExpectedValue:@"135"];
}

#pragma mark - Repeated Invocations of Times

- (void)testRepeatedInvocationsOfTimesHaveNoEffectOnDisplay {
    [self.inputFeeder enterNumberString:@"5"];
    [self.calculator times];
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    [self.calculator times];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testRepeatedInvocationsOfTimesDoNotAffectProduct {
    [self.inputFeeder enterNumberString:@"5"];
    [self.calculator times];
    [self.calculator times];
    [self testMultiplyingTerms:@[@"6"] producesProduct:@"30"];
}

#pragma mark - Helper Methods

- (void)testMultiplyingTerms:(NSArray<NSString *> *)terms producesProduct:(NSString *)expectedProduct {
    [self.inputFeeder enterMultiplicationTerms:terms];
    [self testEqualsProducesExpectedValue:expectedProduct];
}

@end
