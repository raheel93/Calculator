//
//  NSDecimalNumber+OperandAdditions.m
//  Calculator
//
//  Created by Raheel Merali on 7/8/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "NSDecimalNumber+OperandAdditions.h"

#import "Operand.h"

@implementation NSDecimalNumber (OperandAdditions)

#pragma mark - Public

+ (instancetype)calc_decimalNumberWithOperand:(Operand *)operand {
    // -[Operand stringValue] returns a string that uses the US English locale.
    return [self decimalNumberWithString:operand.stringValue locale:self.calc_USEnglishLocale];
}

- (Operand *)calc_operandValue {
    // Use the US English locale so the resulting string contains only the characters allowed by
    // -[Operand initWithString:].
    NSString *stringValue = [self descriptionWithLocale:self.class.calc_USEnglishLocale];
    return [[Operand alloc] initWithString:stringValue];
}

#pragma mark - Private

+ (NSLocale *)calc_USEnglishLocale {
    static dispatch_once_t onceToken;
    static NSLocale *locale;
    dispatch_once(&onceToken, ^{
        locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    });
    return locale;
}

@end
