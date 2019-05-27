//
//  MockCalculator.m
//  CalculatorTests
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "MockCalculator.h"

@implementation MockCalculator

@synthesize display = _display;
@synthesize localizedDisplay = _localizedDisplay;

- (instancetype)init {
    self = [super init];
    if (self) {
        _display = NSStringFromClass(self.class);
        _localizedDisplay = _display;
    }
    return self;
}

#pragma mark - Calculator

- (void)clear {
    [self fulfillExpectationsForSelector:_cmd];
}

- (void)decimal {
    [self fulfillExpectationsForSelector:_cmd];
}

- (void)equals {
    [self fulfillExpectationsForSelector:_cmd];
}

- (void)minus {
    [self fulfillExpectationsForSelector:_cmd];
}

- (void)negate {
    [self fulfillExpectationsForSelector:_cmd];
}

- (void)over {
    [self fulfillExpectationsForSelector:_cmd];
}

- (void)plus {
    [self fulfillExpectationsForSelector:_cmd];
}

- (void)enterDigit:(NSUInteger)digit {
    [self fulfillExpectationsForSelector:_cmd arguments:@[@(digit)]];
}

- (void)times {
    [self fulfillExpectationsForSelector:_cmd];
}

@end
