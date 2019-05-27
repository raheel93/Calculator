//
//  CalculatorInputFeeder.h
//  CalculatorTests
//
//  Created by Raheel Merali on 6/2/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Calculator;

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorInputFeeder : NSObject

- (instancetype)initWithCalculator:(id<Calculator>)calculator;

/**
 @param string A string containing digits, an optional decimal point, and an optional minus sign.
 */
- (void)enterNumberString:(NSString *)string;

/**
 Enters the specified terms into the calculator separated by calls to -plus.
 */
- (void)enterAdditionTerms:(NSArray<NSString *> *)terms;

/**
 Enters the specified terms into the calculator separated by calls to -minus.
 */
- (void)enterSubtractionTerms:(NSArray<NSString *> *)terms;

/**
 Enters the specified terms into the calculator separated by calls to -times.
 */
- (void)enterMultiplicationTerms:(NSArray<NSString *> *)terms;

/**
 Enters the specified terms into the calculator separated by calls to -over.
 */
- (void)enterDivisionTerms:(NSArray<NSString *> *)terms;

@end

@interface CalculatorInputFeeder (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
