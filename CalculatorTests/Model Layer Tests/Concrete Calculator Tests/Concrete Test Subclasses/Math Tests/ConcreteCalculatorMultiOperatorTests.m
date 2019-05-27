//
//  ConcreteCalculatorMultiOperatorTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorAbstractTests.h"

@interface ConcreteCalculatorMultiOperatorTests : ConcreteCalculatorAbstractTests

@end

@implementation ConcreteCalculatorMultiOperatorTests

- (void)testResultOfFirstCalculationIsUsedAsFirstOperandInSubsequentCalculation {
    [self.inputFeeder enterAdditionTerms:@[@"3", @"4"]];
    [self.calculator equals];
    [self.calculator minus];
    [self.inputFeeder enterNumberString:@"1"];
    [self testEqualsProducesExpectedValue:@"6"];
}

- (void)testChangingOperatorClearsImplicitSecondOperand {
    [self.inputFeeder enterAdditionTerms:@[@"1", @"2"]];
    [self.calculator equals];
    
    // Change the operator.
    [self.calculator times];
    
    // Ensure the previous second operand (2) is cleared.
    // The absence of a second term should result in the first term (3) being used as both terms.
    // So, 3*3=9.
    [self testEqualsProducesExpectedValue:@"9"];
}

- (void)testNotChangingOperatorKeepsImplicitSecondOperand {
    // Perform a calculation.
    [self.inputFeeder enterMultiplicationTerms:@[@"18", @"9"]];
    [self.calculator equals];
    
    // Enter a new term but do not change the operator.
    [self.inputFeeder enterNumberString:@"0.2"];
    
    // This should multiply by 9, the second operand in the first calculation.
    [self testEqualsProducesExpectedValue:@"1.8"];
}

- (void)testExpressionEnteredAfterACalculationEvaluatesCorrectly {
    // Perform a calculation.
    [self.inputFeeder enterAdditionTerms:@[@"1", @"2"]];
    [self.calculator equals];
    
    // Ensure subsequent expressions evaluate correctly.
    [self.inputFeeder enterMultiplicationTerms:@[@"5", @"6"]];
    [self testEqualsProducesExpectedValue:@"30"];
}

@end
