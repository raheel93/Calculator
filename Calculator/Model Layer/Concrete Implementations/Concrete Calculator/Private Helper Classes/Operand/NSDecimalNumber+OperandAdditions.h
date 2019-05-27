//
//  NSDecimalNumber+OperandAdditions.h
//  Calculator
//
//  Created by Raheel Merali on 7/8/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Operand;

NS_ASSUME_NONNULL_BEGIN

@interface NSDecimalNumber (OperandAdditions)

@property (nonatomic, readonly) Operand *calc_operandValue;

+ (instancetype)calc_decimalNumberWithOperand:(Operand *)operand;

@end

NS_ASSUME_NONNULL_END
