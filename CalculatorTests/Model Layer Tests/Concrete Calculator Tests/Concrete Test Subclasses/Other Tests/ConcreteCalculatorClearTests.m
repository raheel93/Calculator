//
//  ConcreteCalculatorClearTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 6/1/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorAbstractTests.h"

@interface ConcreteCalculatorClearTests : ConcreteCalculatorAbstractTests

@end

@implementation ConcreteCalculatorClearTests

- (void)testClearingEnteredNumberChangesDisplayToZero {
    [self.inputFeeder enterNumberString:@"410"];
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"0"];
    [self.calculator clear];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testEqualsDoesNotChangeAClearedDisplay {
    [self.inputFeeder enterNumberString:@"789"];
    [self.calculator clear];
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    [self.calculator equals];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testClearUnselectsOperator {
    // "Select" the + operator.
    [self.inputFeeder enterNumberString:@"3"];
    [self.calculator plus];
    
    [self.calculator clear];
    
    // Put any old value on the display.
    [self.inputFeeder enterNumberString:@"4"];
    
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    
    // This should not cause any addition to happen.
    // For example, this should not result in the display showing 7 (3+4).
    [self.calculator equals];
    
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testClearRemovesImplicitEqualsOperation {
    // Perform addition.
    [self.inputFeeder enterNumberString:@"7"];
    [self.calculator plus];
    [self.inputFeeder enterNumberString:@"8"];
    [self.calculator equals];
    
    [self.calculator clear];
    
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    
    // Normally, this would cause 8 to be added to whatever is on the display, but because we cleared, it shouldn't.
    [self.calculator equals];
    
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testClearRemovesNegation {
    // Put a negative number on the display.
    [self.inputFeeder enterNumberString:@"1"];
    [self.calculator negate];
    
    [self.calculator clear];
    
    // The earlier negation should be cleared, so the below call to -enterDigit should result in 2, not -2.
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"2"];
    
    [self.inputFeeder enterNumberString:@"2"];
    
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testClearRemovesDecimalPoint {
    // Put a decimal number on the display.
    [self.calculator decimal];
    [self.inputFeeder enterNumberString:@"4"];
    
    [self.calculator clear];
    
    // The earlier decimal should be cleared, so the below call to -enterDigit should result in 5, not 0.5.
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"5"];

    [self.inputFeeder enterNumberString:@"5"];
    
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testClearingErrorChangesDisplayToZero {
    [self introduceError];
    
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"0"];
    [self.calculator clear];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testClearingErrorAllowsFurtherCalculations {
    [self introduceError];
    
    [self.calculator clear];
    
    // Perform any math and ensure it works
    [self.inputFeeder enterNumberString:@"3"];
    [self.calculator plus];
    [self.inputFeeder enterNumberString:@"5"];
    (void) [self.expectationFactory expectationForDisplayToChangeToString:@"8"];
    [self.calculator equals];
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
