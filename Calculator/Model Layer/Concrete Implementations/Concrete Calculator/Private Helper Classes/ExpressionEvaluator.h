//
//  ExpressionEvaluator.h
//  Calculator
//
//  Created by Raheel Merali on 7/7/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Operand;

NS_ASSUME_NONNULL_BEGIN

@interface ExpressionEvaluator : NSObject

- (nullable Operand *)resultOfExpressionWithFirstOperand:(Operand *)firstOperand
                                                operator:(char)expressionOperator
                                           secondOperand:(Operand *)secondOperand;

@end

NS_ASSUME_NONNULL_END
