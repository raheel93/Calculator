//
//  ConcreteDisplayViewModel.m
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteDisplayViewModel.h"

#import "Calculator.h"

@interface ConcreteDisplayViewModel ()

@property (nonatomic, readonly) NSObject<Calculator> *calculator;

@end

@implementation ConcreteDisplayViewModel

- (instancetype)initWithCalculator:(NSObject<Calculator> *)calculator {
    self = [super init];
    if (self) {
        _calculator = calculator;
    }
    return self;
}

#pragma mark - DisplayViewModel

+ (NSSet<NSString *> *)keyPathsForValuesAffectingText {
    return [NSSet setWithObject:@"calculator.localizedDisplay"];
}

- (NSString *)text {
    return self.calculator.localizedDisplay;
}

@end
