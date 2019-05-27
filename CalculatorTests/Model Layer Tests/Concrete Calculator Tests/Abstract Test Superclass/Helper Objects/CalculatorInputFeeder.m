//
//  CalculatorInputFeeder.m
//  CalculatorTests
//
//  Created by Raheel Merali on 6/2/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "CalculatorInputFeeder.h"

#import "Calculator.h"

@interface CalculatorInputFeeder ()

@property (nonatomic, readonly) id<Calculator> calculator;

@end

@implementation CalculatorInputFeeder

- (instancetype)initWithCalculator:(id<Calculator>)calculator {
    self = [super init];
    if (self) {
        _calculator = calculator;
    }
    return self;
}

#pragma mark - Public

- (void)enterNumberString:(NSString *)string {
    BOOL enteredDecimal = NO;
    BOOL enteredNegativeSign = NO;
    
    for (NSUInteger i = 0; i < string.length; ++i) {
        unichar c = [string characterAtIndex:i];
        
        if (c == '.') {
            NSAssert(!enteredDecimal, @"Multiple decimal points found in string '%@'", string);
            enteredDecimal = YES;
            [self.calculator decimal];
        }
        else if (c == '-') {
            NSAssert(!enteredNegativeSign, @"Multiple negative signs found in string '%@'", string);
            enteredNegativeSign = YES;
        }
        else if (c >= '0' && c <= '9') {
            NSUInteger digit = c - '0';
            [self.calculator enterDigit:digit];
        }
        else {
            NSAssert(NO, @"Invalid character '%c' found in string '%@'", c, string);
        }
    }
    
    if (enteredNegativeSign) {
        [self.calculator negate];
    }
}

- (void)enterAdditionTerms:(NSArray<NSString *> *)terms {
    [self enterTerms:terms withSeparatorBlock:^{
        [self.calculator plus];
    }];
}

- (void)enterSubtractionTerms:(NSArray<NSString *> *)terms {
    [self enterTerms:terms withSeparatorBlock:^{
        [self.calculator minus];
    }];
}

- (void)enterMultiplicationTerms:(NSArray<NSString *> *)terms {
    [self enterTerms:terms withSeparatorBlock:^{
        [self.calculator times];
    }];
}

- (void)enterDivisionTerms:(NSArray<NSString *> *)terms {
    [self enterTerms:terms withSeparatorBlock:^{
        [self.calculator over];
    }];
}

#pragma mark - Private

- (void)enterTerms:(NSArray<NSString *> *)terms withSeparatorBlock:(void (^)(void))separatorBlock {
    NSEnumerator<NSString *> *enumerator = terms.objectEnumerator;
    
    NSString *firstTerm = enumerator.nextObject;
    if (firstTerm) {
        [self enterNumberString:firstTerm];
    }
    
    for (NSString *term in enumerator) {
        separatorBlock();
        [self enterNumberString:term];
    }
}

@end
