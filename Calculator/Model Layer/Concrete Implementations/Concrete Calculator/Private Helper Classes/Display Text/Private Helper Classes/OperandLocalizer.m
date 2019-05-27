//
//  OperandLocalizer.m
//  Calculator
//
//  Created by Raheel Merali on 8/17/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "OperandLocalizer.h"

#import "OperandStringValues.h"
#import "Operand.h"
#import "NSDecimalNumber+OperandAdditions.h"

@interface OperandLocalizer ()

@property (nonatomic, readonly) NSNumberFormatter *numberFormatter;

@end

@implementation OperandLocalizer

- (instancetype)initWithLocale:(NSLocale *)locale {
    self = [super init];
    if (self) {
        _numberFormatter = [self.class makeNumberFormatterWithLocale:locale];
    }
    return self;
}

- (OperandStringValues *)stringValuesForOperand:(Operand *)operand {
    NSString *unlocalizedString = operand.stringValue;
    
    NSNumberFormatter *formatter = self.numberFormatter;
    [self configureFormatter:formatter forNumberString:unlocalizedString];
    NSString *localizedString = [formatter stringFromNumber:[NSDecimalNumber calc_decimalNumberWithOperand:operand]];
    
    return [[OperandStringValues alloc] initWithStringValue:unlocalizedString
                                       localizedStringValue:localizedString];
}

#pragma mark - Private

- (void)configureFormatter:(NSNumberFormatter *)formatter forNumberString:(NSString *)numberString {
    NSInteger indexOfDecimalPoint = [numberString rangeOfString:@"."].location;
    BOOL containsDecimalPoint = (indexOfDecimalPoint != NSNotFound);
    NSUInteger countOfFractionDigits = containsDecimalPoint ? (numberString.length - indexOfDecimalPoint - 1) : 0;
    
    formatter.minimumFractionDigits = countOfFractionDigits;
    formatter.alwaysShowsDecimalSeparator = containsDecimalPoint;
}

+ (NSNumberFormatter *)makeNumberFormatterWithLocale:(NSLocale *)locale {
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.locale = locale;
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    // NSUIntegerMax would be a logical value here, but using that value causes the
    // formatter to produce weird results.
    formatter.maximumIntegerDigits = 1000;
    formatter.maximumFractionDigits = 1000;
    
    return formatter;
}

@end
