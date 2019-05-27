//
//  ExpectationTable.h
//  CalculatorTests
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XCTestExpectation;

NS_ASSUME_NONNULL_BEGIN

/**
 A lookup table for expectations.
 */
@interface ExpectationTable : NSObject

- (void)addExpectation:(XCTestExpectation *)expectation forSelector:(SEL)selector arguments:(NSArray *)arguments;
- (NSArray<XCTestExpectation *> *)expectationsForSelector:(SEL)selector arguments:(NSArray *)arguments;
- (void)removeExpectationsForSelector:(SEL)selector arguments:(NSArray *)arguments;

@end

NS_ASSUME_NONNULL_END
