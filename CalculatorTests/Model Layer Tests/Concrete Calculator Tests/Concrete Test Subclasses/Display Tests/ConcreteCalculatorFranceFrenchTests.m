//
//  ConcreteCalculatorFranceFrenchTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 7/9/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorAbstractTests.h"

@interface ConcreteCalculatorFranceFrenchTests : ConcreteCalculatorAbstractTests

@end

@implementation ConcreteCalculatorFranceFrenchTests

- (void)testLocalizedDisplayUsesCommaAsDecimalSeparator {
    [self testEnteringNumber:@"1.23" causesLocalizedDisplayToChangeToValue:@"1,23"];
}

#pragma mark - Private

- (void)testEnteringNumber:(NSString *)numberString causesLocalizedDisplayToChangeToValue:(NSString *)expectedValue {
    XCTestExpectation *expectation = [self.expectationFactory expectationForLocalizedDisplayToChangeToString:expectedValue];
    [self.inputFeeder enterNumberString:numberString];
    [self waitForExpectations:@[expectation] timeout:0];
}

#pragma mark - Overrides

- (ConcreteCalculator *)makeCalculator {
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"fr_FR"];
    return [[ConcreteCalculator alloc] initWithLocale:locale];
}

@end
