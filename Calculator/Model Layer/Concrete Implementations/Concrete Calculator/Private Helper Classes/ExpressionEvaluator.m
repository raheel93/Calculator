//
//  ExpressionEvaluator.m
//  Calculator
//
//  Created by Raheel Merali on 7/7/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ExpressionEvaluator.h"

#import "Operand.h"
#import "NSDecimalNumber+OperandAdditions.h"

@implementation ExpressionEvaluator

#pragma mark - Public

- (Operand *)resultOfExpressionWithFirstOperand:(Operand *)firstOperand
                                       operator:(char)expressionOperator
                                  secondOperand:(Operand *)secondOperand {
    // Entering 3.000 and calling equals (without having selected an operator) should sanitize
    // your input and give you 3.
    if (!expressionOperator) {
        return [self sanitizedOperandForOperand:firstOperand];
    }
    
    NSDecimal a = [self decimalWithOperand:firstOperand];
    NSDecimal b = [self decimalWithOperand:secondOperand];
    NSDecimal result = self.zeroDecimal;
    NSCalculationError error = NSCalculationNoError;
    
    switch (expressionOperator) {
        case '+':
            error = NSDecimalAdd(&result, &a, &b, self.roundingMode);
            break;
        case '-':
            error = NSDecimalSubtract(&result, &a, &b, self.roundingMode);
            break;
        case '*':
            error = NSDecimalMultiply(&result, &a, &b, self.roundingMode);
            break;
        case '/':
            error = NSDecimalDivide(&result, &a, &b, self.roundingMode);
            break;
        default:
            return nil;
    }
    
    BOOL didFail = (error != NSCalculationNoError);
    if (didFail) {
        return nil;
    }
    
    return [self operandWithDecimal:result];
}

#pragma mark - Private

- (Operand *)operandWithDecimal:(NSDecimal)decimal {
    return [NSDecimalNumber decimalNumberWithDecimal:decimal].calc_operandValue;
}

- (NSDecimal)decimalWithOperand:(Operand *)operand {
    return [NSDecimalNumber calc_decimalNumberWithOperand:operand].decimalValue;
}

- (Operand *)sanitizedOperandForOperand:(Operand *)operand {
    // Sanitize by roundtripping through NSDecimalNumber.
    return [NSDecimalNumber calc_decimalNumberWithOperand:operand].calc_operandValue;
}

- (NSDecimal)zeroDecimal {
    return [[NSDecimalNumber alloc] initWithFloat:0].decimalValue;
}

- (NSRoundingMode)roundingMode {
    return NSRoundPlain;
}

@end
