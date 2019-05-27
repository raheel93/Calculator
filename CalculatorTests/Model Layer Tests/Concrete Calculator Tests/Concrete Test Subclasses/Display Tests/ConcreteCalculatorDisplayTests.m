//
//  ConcreteCalculatorDisplayTests.m
//  CalculatorTests
//
//  Created by Raheel Merali on 6/1/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorAbstractTests.h"

@interface ConcreteCalculatorDisplayTests : ConcreteCalculatorAbstractTests

@end

@implementation ConcreteCalculatorDisplayTests

- (void)testInitialValueOfDisplayIsZero {
    XCTAssertEqualObjects(self.calculator.display, @"0");
}

@end
