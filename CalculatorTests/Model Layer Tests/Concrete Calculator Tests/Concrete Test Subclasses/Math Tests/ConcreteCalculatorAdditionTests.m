//
//  ConcreteCalculatorAdditionTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 5/27/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorAbstractTests.h"

@interface ConcreteCalculatorAdditionTests : ConcreteCalculatorAbstractTests

@end

@implementation ConcreteCalculatorAdditionTests

#pragma mark - Integers Only

- (void)testCase1IntegersOnly {
    [self testAddingTerms:@[@"4", @"6"] producesSum:@"10"];
}

- (void)testCase2IntegersOnly {
    [self testAddingTerms:@[@"10", @"-2"] producesSum:@"8"];
}

- (void)testCase3IntegersOnly {
    [self testAddingTerms:@[@"30", @"-50"] producesSum:@"-20"];
}

- (void)testCase4IntegersOnly {
    [self testAddingTerms:@[@"-100", @"-50"] producesSum:@"-150"];
}

- (void)testCase5IntegersOnly {
    [self testAddingTerms:@[@"1", @"2", @"3"] producesSum:@"6"];
}

- (void)testCase6IntegersOnly {
    [self testAddingTerms:@[@"-4", @"-20", @"-64", @"-100"] producesSum:@"-188"];
}

#pragma mark - Floats Only

- (void)testCase1FloatsOnly {
    [self testAddingTerms:@[@"3.1", @"3.2"] producesSum:@"6.3"];
}

- (void)testCase2FloatsOnly {
    [self testAddingTerms:@[@"4.5", @"-9.1"] producesSum:@"-4.6"];
}

- (void)testCase3FloatsOnly {
    [self testAddingTerms:@[@"3.6", @"-6.6"] producesSum:@"-3"];
}

- (void)testCase4FloatsOnly {
    [self testAddingTerms:@[@"809.3", @"-1000.120294"] producesSum:@"-190.820294"];
}

- (void)testCase5FloatsOnly {
    [self testAddingTerms:@[@"9301.401930194395", @"3.14", @"1038.0"] producesSum:@"10342.541930194395"];
}

- (void)testCase6FloatsOnly {
    [self testAddingTerms:@[@"-10.10", @"-20.20", @"-30.30", @"-40.40"] producesSum:@"-101"];
}

#pragma marked - Mixed Integers and Floats

- (void)testCase1Mixed {
    [self testAddingTerms:@[@"12", @"18.18"] producesSum:@"30.18"];
}

- (void)testCase2Mixed {
    [self testAddingTerms:@[@"50", @"-30.30"] producesSum:@"19.7"];
}

- (void)testCase3Mixed {
    [self testAddingTerms:@[@"100", @"-100000.4"] producesSum:@"-99900.4"];
}

- (void)testCase4Mixed {
    [self testAddingTerms:@[@"-750", @"-8.9"] producesSum:@"-758.9"];
}

- (void)testCase5Mixed {
    [self testAddingTerms:@[@"30", @"16.5", @"10.3"] producesSum:@"56.8"];
}

- (void)testCase6Mixed {
    [self testAddingTerms:@[@"1", @"2", @"3.0", @"4.0"] producesSum:@"10"];
}

#pragma mark - Other

- (void)testPlusActsLikeEqualsAfterTwoTermsEntered {
    [self.inputFeeder enterSubtractionTerms:@[@"3", @"4"]];
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"-1"];
    [self.calculator plus];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testPlusAfterACalculationDoesNotChangeDisplay {
    // Perform any old calculation.
    [self.inputFeeder enterAdditionTerms:@[@"3", @"-6"]];
    [self.calculator equals];
    
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    [self.calculator plus];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

#pragma mark - Error Cases

- (void)testOverflowingSumProducesError {
    [self enterTermsThatWillOverflow];
    [self testEqualsProducesExpectedValue:self.constants.errorText];
}

- (void)testUnderflowingSumProducesError {
    [self testAddingTerms:@[self.constants.smallestSupportedInteger, @"-1"]
              producesSum:self.constants.errorText];
}

- (void)testAddingToErrorProducesError {
    // Produce an error
    [self enterTermsThatWillOverflow];
    [self.calculator equals];
    
    // Add to the error
    [self.calculator plus];
    [self.inputFeeder enterNumberString:@"-1000"];
    [self testEqualsProducesExpectedValue:self.constants.errorText];
}

- (void)enterTermsThatWillOverflow {
    [self.inputFeeder enterAdditionTerms:@[self.constants.halfOfLargestSupportedInteger,
                                           self.constants.halfOfLargestSupportedInteger,
                                           @"1"]];
}

#pragma mark - Repeated Invocations of Equals

- (void)testSecondInvocationOfEqualsProducesSumByAddingLastEnteredTerm {
    [self.inputFeeder enterAdditionTerms:@[@"5", @"3"]];
    [self.calculator equals];
    [self testEqualsProducesExpectedValue:@"11"];
}

- (void)testThirdInvocationOfEqualsProducesSumByAddingLastEnteredTerm {
    [self.inputFeeder enterAdditionTerms:@[@"5", @"3"]];
    [self.calculator equals];
    [self.calculator equals];
    [self testEqualsProducesExpectedValue:@"14"];
}

#pragma mark - Repeated Invocations of Plus

- (void)testRepeatedInvocationsOfPlusHaveNoEffectOnDisplay {
    [self.inputFeeder enterNumberString:@"5"];
    [self.calculator plus];
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    [self.calculator plus];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testRepeatedInvocationsOfPlusDoNotAffectSum {
    [self.inputFeeder enterNumberString:@"5"];
    [self.calculator plus];
    [self.calculator plus];
    [self testAddingTerms:@[@"6"] producesSum:@"11"];
}

#pragma mark - Helper Methods

- (void)testAddingTerms:(NSArray<NSString *> *)terms producesSum:(NSString *)sum {
    [self.inputFeeder enterAdditionTerms:terms];
    [self testEqualsProducesExpectedValue:sum];
}

@end
