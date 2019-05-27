//
//  ConcreteCalculatorSubtractionTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 6/1/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorAbstractTests.h"

@interface ConcreteCalculatorSubtractionTests : ConcreteCalculatorAbstractTests

@end

@implementation ConcreteCalculatorSubtractionTests

#pragma mark - Integers Only

- (void)testCase1IntegersOnly {
    [self testSubtractingTerms:@[@"8", @"3"] producesDifference:@"5"];
}

- (void)testCase2IntegersOnly {
    [self testSubtractingTerms:@[@"30", @"-90"] producesDifference:@"120"];
}

- (void)testCase3IntegersOnly {
    [self testSubtractingTerms:@[@"-30", @"-50"] producesDifference:@"20"];
}

- (void)testCase4IntegersOnly {
    [self testSubtractingTerms:@[@"-9", @"-3"] producesDifference:@"-6"];
}

- (void)testCase5IntegersOnly {
    [self testSubtractingTerms:@[@"11", @"2", @"1"] producesDifference:@"8"];
}

- (void)testCase6IntegersOnly {
    [self testSubtractingTerms:@[@"-1200", @"-1500", @"1300", @"1400"] producesDifference:@"-2400"];
}

#pragma mark - Floats Only

- (void)testCase1FloatsOnly {
    [self testSubtractingTerms:@[@"3.14", @"1.14"] producesDifference:@"2"];
}

- (void)testCase2FloatsOnly {
    [self testSubtractingTerms:@[@"1.1", @"-2.2", @"-3.3", @"-4.4"] producesDifference:@"11"];
}

- (void)testCase3FloatsOnly {
    [self testSubtractingTerms:@[@"6400.1", @"3100.3"] producesDifference:@"3299.8"];
}

#pragma marked - Mixed Integers and Floats

- (void)testCase1Mixed {
    [self testSubtractingTerms:@[@"41.6", @"1"] producesDifference:@"40.6"];
}

- (void)testCase2Mixed {
    [self testSubtractingTerms:@[@"-16.1", @"9.2", @"1"] producesDifference:@"-26.3"];
}

#pragma mark - Other

- (void)testMinusActsLikeEqualsAfterTwoTermsEntered {
    [self.inputFeeder enterAdditionTerms:@[@"3", @"4"]];
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"7"];
    [self.calculator minus];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testMinusAfterACalculationDoesNotChangeDisplay {
    // Perform any old calculation.
    [self.inputFeeder enterAdditionTerms:@[@"3", @"-6"]];
    [self.calculator equals];
    
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    [self.calculator minus];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

#pragma mark - Error Cases

- (void)testOverflowingDifferenceProducesError {
    [self enterTermsThatWillOverflow];
    [self testEqualsProducesExpectedValue:self.constants.errorText];
}

- (void)testUnderflowingDifferenceReportsError {
    [self testSubtractingTerms:@[self.constants.smallestSupportedInteger, @"1"]
            producesDifference:self.constants.errorText];
}

- (void)testSubtractingFromErrorProducesError {
    // Introduce error
    [self enterTermsThatWillOverflow];
    [self.calculator equals];
    
    // Subtract from the error
    [self.calculator minus];
    [self.inputFeeder enterNumberString:@"5"];
    [self testEqualsProducesExpectedValue:self.constants.errorText];
}

- (void)enterTermsThatWillOverflow {
    [self.inputFeeder enterAdditionTerms:@[@"0",
                                           self.constants.negativeHalfOfLargestSupportedInteger,
                                           self.constants.negativeHalfOfLargestSupportedInteger,
                                           @"-1"]];
}

#pragma mark - Repeated Invocations of Equals

- (void)testSecondInvocationOfEqualsProducesDifferenceBySubtractingLastEnteredTerm {
    [self.inputFeeder enterSubtractionTerms:@[@"5", @"3"]];
    [self.calculator equals];
    [self testEqualsProducesExpectedValue:@"-1"];
}

- (void)testThirdInvocationOfEqualsProducesDifferenceBySubtractingLastEnteredTerm {
    [self.inputFeeder enterSubtractionTerms:@[@"5", @"3"]];
    [self.calculator equals];
    [self.calculator equals];
    [self testEqualsProducesExpectedValue:@"-4"];
}

#pragma mark - Repeated Invocations of Minus

- (void)testRepeatedInvocationsOfMinusHaveNoEffectOnDisplay {
    [self.inputFeeder enterNumberString:@"5"];
    [self.calculator minus];
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    [self.calculator minus];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testRepeatedInvocationsOfMinusDoNotAffectDifference {
    [self.inputFeeder enterNumberString:@"5"];
    [self.calculator minus];
    [self.calculator minus];
    [self testSubtractingTerms:@[@"6"] producesDifference:@"-1"];
}

#pragma mark - Helper Methods

- (void)testSubtractingTerms:(NSArray<NSString *> *)terms producesDifference:(NSString *)expectedDifference {
    [self.inputFeeder enterSubtractionTerms:terms];
    [self testEqualsProducesExpectedValue:expectedDifference];
}

@end
