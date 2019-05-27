//
//  ConcreteCalculatorNumberEntryTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 6/1/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorAbstractTests.h"

@interface ConcreteCalculatorNumberEntryTests : ConcreteCalculatorAbstractTests

@end

@implementation ConcreteCalculatorNumberEntryTests

#pragma mark - Special Cases

- (void)testMultipleLeadingZeroesToLeftOfDecimalPointGetSwallowed {
    [self.inputFeeder enterNumberString:@"0"];
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    [self.inputFeeder enterNumberString:@"0"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testStandaloneZeroDigitGetsReplacedByFirstEnteredNonzeroDigit {
    [self.inputFeeder enterNumberString:@"0"];
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"3"];
    [self.inputFeeder enterNumberString:@"3"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testDigitsEnteredAfterErrorAreShownOnDisplay {
    [self introduceError];
    [self.calculator plus];
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"1"];
    [self.inputFeeder enterNumberString:@"1"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

#pragma mark - General Digit Selection

- (void)testEnteringNonzeroDigitCausesDisplayToShowDigit {
    // Don't test 0 because it's the default initial value of the display, and as a result it won't fire KVO.
    for (NSUInteger i = 1; i <= 9; ++i) {
        [self.calculator clear];
        (void) [self.expectationFactory expectationForDisplayToChangeToString:@(i).stringValue];
        [self.calculator enterDigit:i];
        [self waitForExpectationsWithTimeout:0 handler:nil];
    }
}

- (void)testEnteringZeroAfterNonzeroDigitCausesDisplayToAppendZero {
    [self.inputFeeder enterNumberString:@"3"];
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"30"];
    [self.inputFeeder enterNumberString:@"0"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

#pragma mark - Intermediate Display Values

// The tests in this section break the single assert per-test rule.

- (void)testIntermediateDisplayValues1 {
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"3"];
    [self.inputFeeder enterNumberString:@"3"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
    
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"34"];
    [self.inputFeeder enterNumberString:@"4"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
    
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"349"];
    [self.inputFeeder enterNumberString:@"9"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testIntermediateDisplayValues2 {
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"5"];
    [self.inputFeeder enterNumberString:@"5"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
    
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"-5"];
    [self.calculator negate];
    [self waitForExpectationsWithTimeout:0 handler:nil];
    
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"-5."];
    [self.calculator decimal];
    [self waitForExpectationsWithTimeout:0 handler:nil];
    
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"-5.2"];
    [self.inputFeeder enterNumberString:@"2"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testIntermediateDisplayValues3 {
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"0."];
    [self.calculator decimal];
    [self waitForExpectationsWithTimeout:0 handler:nil];
    
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"0.5"];
    [self.inputFeeder enterNumberString:@"5"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
    
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"0.52"];
    [self.inputFeeder enterNumberString:@"2"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testIntermediateDisplayValues4 {
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"4"];
    [self.inputFeeder enterNumberString:@"4"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
    
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"42"];
    [self.inputFeeder enterNumberString:@"2"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
    
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"42."];
    [self.calculator decimal];
    [self waitForExpectationsWithTimeout:0 handler:nil];
    
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"42.3"];
    [self.inputFeeder enterNumberString:@"3"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
    
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"42.34"];
    [self.inputFeeder enterNumberString:@"4"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

#pragma mark -

- (void)testDigitsEnteredAfterPerformingACalculationAreShownOnDisplay {
    [self.inputFeeder enterAdditionTerms:@[@"10", @"2"]];
    [self.calculator equals];
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"3"];
    [self.inputFeeder enterNumberString:@"3"];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

#pragma mark - Helper Methods

// This helper method breaks the single assert per-test rule.
- (void)introduceError {
    [self.inputFeeder enterNumberString:self.constants.largestSupportedInteger];
    [self.calculator plus];
    [self.inputFeeder enterNumberString:@"1"];
    (void) [self.expectationFactory expectationForDisplayToChangeToString:self.constants.errorText];
    [self.calculator equals];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

@end
