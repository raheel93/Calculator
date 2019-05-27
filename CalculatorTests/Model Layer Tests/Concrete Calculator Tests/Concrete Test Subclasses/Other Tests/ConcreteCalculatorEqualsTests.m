//
//  ConcreteCalculatorEqualsTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 6/1/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorAbstractTests.h"

@interface ConcreteCalculatorEqualsTests : ConcreteCalculatorAbstractTests

@end

@implementation ConcreteCalculatorEqualsTests

- (void)testEqualsRemovesTrailingDecimalPoint {
    [self.inputFeeder enterNumberString:@"3"];
    [self.calculator decimal];
    [self testEqualsProducesExpectedValue:@"3"];
}

- (void)testEqualsRemovesTrailingZeroesAfterDecimalPoint {
    [self.inputFeeder enterNumberString:@"3.1400000"];
    [self testEqualsProducesExpectedValue:@"3.14"];
}

- (void)testCallingEqualsWithoutHavingEnteredASecondTermCausesFirstTermToBeTreatedAsBothTerms {
    [self.inputFeeder enterNumberString:@"7"];
    [self.calculator plus];
    [self testEqualsProducesExpectedValue:@"14"];
}

@end
