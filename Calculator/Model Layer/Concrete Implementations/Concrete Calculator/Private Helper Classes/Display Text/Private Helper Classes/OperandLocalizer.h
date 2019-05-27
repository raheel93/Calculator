//
//  OperandLocalizer.h
//  Calculator
//
//  Created by Raheel Merali on 8/17/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Operand;
@class OperandStringValues;

NS_ASSUME_NONNULL_BEGIN

@interface OperandLocalizer : NSObject

- (instancetype)initWithLocale:(NSLocale *)locale;

- (OperandStringValues *)stringValuesForOperand:(Operand *)operand;

@end

@interface OperandLocalizer (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
