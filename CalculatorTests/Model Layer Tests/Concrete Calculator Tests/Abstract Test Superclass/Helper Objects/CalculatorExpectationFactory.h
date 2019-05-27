//
//  CalculatorExpectationFactory.h
//  CalculatorTests
//
//  Created by Raheel Merali on 7/13/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <XCTest/XCTest.h>

@protocol Calculator;

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorExpectationFactory : NSObject

@property (nonatomic, weak, readonly) XCTestCase *testCase;

- (instancetype)initWithCalculator:(NSObject<Calculator> *)calculator testCase:(XCTestCase *)testCase;

// Display expectations
- (XCTestExpectation *)expectationForDisplayToChangeToString:(NSString *)text XCT_WARN_UNUSED;
- (XCTestExpectation *)expectationForDisplayToChange XCT_WARN_UNUSED;
- (XCTestExpectation *)invertedExpectationForDisplayToChange XCT_WARN_UNUSED;
- (XCTestExpectation *)expectationForDisplayToMatchRegularExpression:(NSString *)regex XCT_WARN_UNUSED;

// Localized display expectations
- (XCTestExpectation *)expectationForLocalizedDisplayToChangeToString:(NSString *)text XCT_WARN_UNUSED;

@end

@interface CalculatorExpectationFactory (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
