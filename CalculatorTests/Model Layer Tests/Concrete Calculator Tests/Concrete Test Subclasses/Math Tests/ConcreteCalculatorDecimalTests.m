//
//  ConcreteCalculatorDecimalTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 6/1/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorAbstractTests.h"

@interface ConcreteCalculatorDecimalTests : ConcreteCalculatorAbstractTests

@end

@implementation ConcreteCalculatorDecimalTests

- (void)testDecimalInsertsDecimalPointAfterZero {
    [self testDecimalCausesDisplayToChangeToString:@"0."];
}

- (void)testDecimalInsertsADecimalPointAfterPositiveInteger {
    [self.inputFeeder enterNumberString:@"3"];
    [self testDecimalCausesDisplayToChangeToString:@"3."];
}

- (void)testDecimalInsertsDecimalPointAfterNegativeInteger {
    [self.inputFeeder enterNumberString:@"-500"];
    [self testDecimalCausesDisplayToChangeToString:@"-500."];
}

- (void)testSecondCallToDecimalDoesNotChangeDisplay {
    [self.calculator decimal];
    (void) [self.expectationFactory invertedExpectationForDisplayToChange];
    [self.calculator decimal];
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

- (void)testEnteringDecimalAfterPerformingACalculationStartsANewOperand {
    [self.inputFeeder enterAdditionTerms:@[@"1", @"2"]];
    [self.calculator equals];
    [self testDecimalCausesDisplayToChangeToString:@"0."];
}

- (void)testDecimalDoesNotAffectImplicitSecondOperand {
    [self.inputFeeder enterMultiplicationTerms:@[@"5", @"9"]];
    [self.calculator equals];
    
    [self.inputFeeder enterNumberString:@".3"];
    
    // Should result in .3 * 9 (the implicit second operand) = 2.7
    [self testEqualsProducesExpectedValue:@"2.7"];
}

#pragma mark - Helper

- (void)testDecimalCausesDisplayToChangeToString:(NSString *)string {
    XCTestExpectation *expectation = [self.expectationFactory expectationForDisplayToChangeToString:string];
    [self.calculator decimal];
    [self waitForExpectations:@[expectation] timeout:0];
}

@end
