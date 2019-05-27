//
//  ConcreteCalculatorViewModel.m
//  Calculator
//
//  Created by Raheel Merali on 6/23/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorViewModel.h"

#import "ConcreteCalculator.h"
#import "LoggingCalculator.h"
#import "ConcreteDisplayViewModel.h"
#import "ConcreteButtonPadViewModel.h"

@implementation ConcreteCalculatorViewModel

@synthesize displayViewModel = _displayViewModel;
@synthesize buttonPadViewModel = _buttonPadViewModel;

- (instancetype)init {
    self = [super init];
    if (self) {
        NSObject<Calculator> *calculator = [self makeCalculator];
        _displayViewModel = [[ConcreteDisplayViewModel alloc] initWithCalculator:calculator];
        _buttonPadViewModel = [[ConcreteButtonPadViewModel alloc] initWithCalculator:calculator];
    }
    return self;
}

#pragma mark - Private

- (NSObject<Calculator> *)makeCalculator {
    NSObject<Calculator> *calculator;
    calculator = [ConcreteCalculator new];
    calculator = [[LoggingCalculator alloc] initWithBaseCalculator:calculator];
    return calculator;
}

@end
