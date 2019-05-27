//
//  ConcreteCalculatorUSEnglishTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 7/9/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorAbstractTests.h"

@interface ConcreteCalculatorUSEnglishTests : ConcreteCalculatorAbstractTests

@end

@implementation ConcreteCalculatorUSEnglishTests

- (void)testInitialValueOfLocalizedDisplayIsZero {
    XCTAssertEqualObjects(self.calculator.localizedDisplay, @"0");
}

- (void)testLocalizedDisplayDoesNotAddCommaSeparatorForThreeDigitNumber {
    [self testEnteringNumber:@"123" causesLocalizedDisplayToChangeToValue:@"123"];
}

- (void)testLocalizedDisplayAddsCommaSeparatorsForLargestSupportedInteger {
    [self testEnteringNumber:self.constants.largestSupportedInteger causesLocalizedDisplayToChangeToValue:self.constants.largestSupportedIntegerLocalizedInUSEnglish];
}

- (void)testLocalizedDisplayAddsCommaSeparatorForPositiveInteger {
    [self testEnteringNumber:@"1234" causesLocalizedDisplayToChangeToValue:@"1,234"];
}

- (void)testLocalizedDisplayAddsCommaSeparatorForNegativeInteger {
    [self testEnteringNumber:@"-1234" causesLocalizedDisplayToChangeToValue:@"-1,234"];
}

- (void)testLocalizedDisplayAddsCommaSeparatorForPositiveFloat {
    [self testEnteringNumber:@"54132.29" causesLocalizedDisplayToChangeToValue:@"54,132.29"];
}

- (void)testLocalizedDisplayAddsCommaSeparatorForNegativeFloat {
    [self testEnteringNumber:@"-5000.28" causesLocalizedDisplayToChangeToValue:@"-5,000.28"];
}

- (void)testLocalizedDisplayAddsMultipleCommaSeparatorsForLargePositiveFloat {
    [self testEnteringNumber:@"150210213.20491" causesLocalizedDisplayToChangeToValue:@"150,210,213.20491"];
}

- (void)testLocalizedDisplayShowsError {
    [self.inputFeeder enterDivisionTerms:@[@"5", @"0"]];
    [self.calculator equals];
    XCTAssertEqualObjects(self.calculator.localizedDisplay, self.constants.errorTextLocalizedInUSEnglish);
}

- (void)testLocalizedDisplayContainsTrailingDecimalPoint {
    [self testEnteringNumber:@"3." causesLocalizedDisplayToChangeToValue:@"3."];
}

- (void)testLocalizedDisplayContainsTrailingZeroesAfterDecimalPoint {
    [self testEnteringNumber:@"5.00" causesLocalizedDisplayToChangeToValue:@"5.00"];
}

- (void)testLocalizedDisplayShowsNegativeSignForNumbersLessThanOne {
    [self.inputFeeder enterNumberString:@"0.3"];
    [self.calculator negate];
    XCTAssertEqualObjects(self.calculator.localizedDisplay, @"-0.3");
}

#pragma mark - Private

- (void)testEnteringNumber:(NSString *)numberString causesLocalizedDisplayToChangeToValue:(NSString *)expectedValue {
    XCTestExpectation *expectation = [self.expectationFactory expectationForLocalizedDisplayToChangeToString:expectedValue];
    [self.inputFeeder enterNumberString:numberString];
    [self waitForExpectations:@[expectation] timeout:0];
}

@end
