//
//  ConcreteButtonPadViewModelTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteButtonPadViewModel.h"
#import "MockCalculator.h"
#import "ButtonViewModel.h"

#import <XCTest/XCTest.h>

@interface ConcreteButtonPadViewModelTests : XCTestCase

@property (nonatomic) MockCalculator *calculator;
@property (nonatomic) ConcreteButtonPadViewModel *viewModel;

@end

@implementation ConcreteButtonPadViewModelTests

- (void)setUp {
    self.calculator = [MockCalculator new];
    self.viewModel = [[ConcreteButtonPadViewModel alloc] initWithCalculator:self.calculator];
}

#pragma mark - Non-Digits

- (void)testClearButtonCallsClearOnCalculator {
    [self testButtonAtRow:0 column:0 performsSelectorOnCalculator:@selector(clear)];
}

- (void)testNegateButtonCallsNegateOnCalculator {
    [self testButtonAtRow:0 column:1 performsSelectorOnCalculator:@selector(negate)];
}

- (void)testDivideButtonCallsDivideOnCalculator {
    [self testButtonAtRow:0 column:3 performsSelectorOnCalculator:@selector(over)];
}

- (void)testMultiplyButtonCallsMultiplyOnCalculator {
    [self testButtonAtRow:1 column:3 performsSelectorOnCalculator:@selector(times)];
}

- (void)testSubtractButtonCallsSubtractOnCalculator {
    [self testButtonAtRow:2 column:3 performsSelectorOnCalculator:@selector(minus)];
}

- (void)testPlusButtonCallsPlusOnCalculator {
    [self testButtonAtRow:3 column:3 performsSelectorOnCalculator:@selector(plus)];
}

- (void)testEqualsButtonCallsEqualsOnCalculator {
    [self testButtonAtRow:4 column:3 performsSelectorOnCalculator:@selector(equals)];
}

- (void)testDecimalButtonCallsDecimalOnCalculator {
    [self testButtonAtRow:4 column:2 performsSelectorOnCalculator:@selector(decimal)];
}

- (void)testButtonAtRow:(NSUInteger)rowIndex column:(NSUInteger)columnIndex performsSelectorOnCalculator:(SEL)selector {
    XCTestExpectation *expectation = [self.calculator expectationForSelectorToBePerformed:selector
                                                                            withArguments:@[]
                                                                                 testCase:self];
    [[self.viewModel buttonAtRow:rowIndex column:columnIndex] press];
    [self waitForExpectations:@[expectation] timeout:0];
}

#pragma mark - Digits

- (void)testZeroButtonEntersZeroOnCalculator {
    [self testButtonAtRow:4 column:0 entersDigitOnCalculator:0];
}

- (void)testOneButtonEntersOneOnCalculator {
    [self testButtonAtRow:3 column:0 entersDigitOnCalculator:1];
}

- (void)testTwoButtonEntersTwoOnCalculator {
    [self testButtonAtRow:3 column:1 entersDigitOnCalculator:2];
}

- (void)testThreeButtonEntersThreeOnCalculator {
    [self testButtonAtRow:3 column:2 entersDigitOnCalculator:3];
}

- (void)testFourButtonEntersFourOnCalculator {
    [self testButtonAtRow:2 column:0 entersDigitOnCalculator:4];
}

- (void)testFiveButtonEntersFiveOnCalculator {
    [self testButtonAtRow:2 column:1 entersDigitOnCalculator:5];
}

- (void)testSixButtonEntersSixOnCalculator {
    [self testButtonAtRow:2 column:2 entersDigitOnCalculator:6];
}

- (void)testSevenButtonEntersSevenOnCalculator {
    [self testButtonAtRow:1 column:0 entersDigitOnCalculator:7];
}

- (void)testEightButtonEntersEightOnCalculator {
    [self testButtonAtRow:1 column:1 entersDigitOnCalculator:8];
}

- (void)testNineButtonEntersNineOnCalculator {
    [self testButtonAtRow:1 column:2 entersDigitOnCalculator:9];
}

- (void)testButtonAtRow:(NSUInteger)rowIndex column:(NSUInteger)columnIndex entersDigitOnCalculator:(NSUInteger)digit {
    XCTestExpectation *expectation = [self.calculator expectationForSelectorToBePerformed:@selector(enterDigit:)
                                                                            withArguments:@[@(digit)]
                                                                                 testCase:self];
    [[self.viewModel buttonAtRow:rowIndex column:columnIndex] press];
    [self waitForExpectations:@[expectation] timeout:0];
}

@end
