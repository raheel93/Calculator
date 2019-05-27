//
//  Operand.h
//  Calculator
//
//  Created by Raheel Merali on 6/1/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Operand : NSObject

/**
 An unlocalized representation of the operand.
 The characters in the returned string are limited to '-', '.', and the digits 0-9.
 */
@property (nonatomic, copy, readonly) NSString *stringValue;

/**
 YES if the operand is unpopulated; NO otherwise.
 */
@property (nonatomic, readonly, getter=isEmpty) BOOL empty;

/**
 Creates an operand populated with the contents of the specified string.
 
 @param string The initial value of the operand. The only allowed characters are those
               specified in the documentation for the `stringValue` property.
 */
- (instancetype)initWithString:(NSString *)string;

- (void)appendDigit:(NSUInteger)digit;
- (void)appendDecimalPoint;
- (void)negate;

/**
 Depopulates the operand.
 */
- (void)clear;

@end

NS_ASSUME_NONNULL_END
