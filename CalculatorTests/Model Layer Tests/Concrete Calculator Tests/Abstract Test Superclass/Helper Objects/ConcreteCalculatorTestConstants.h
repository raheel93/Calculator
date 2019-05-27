//
//  ConcreteCalculatorTestConstants.h
//  CalculatorTests
//
//  Created by Raheel Merali on 6/2/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConcreteCalculatorTestConstants : NSObject

@property (nonatomic, copy, readonly) NSString *errorText;
@property (nonatomic, copy, readonly) NSString *errorTextLocalizedInUSEnglish;

@property (nonatomic, copy, readonly) NSString *smallestSupportedInteger;

@property (nonatomic, copy, readonly) NSString *largestSupportedInteger;
@property (nonatomic, copy, readonly) NSString *largestSupportedIntegerLocalizedInUSEnglish;
@property (nonatomic, copy, readonly) NSString *halfOfLargestSupportedInteger;
@property (nonatomic, copy, readonly) NSString *negativeHalfOfLargestSupportedInteger;

@end

NS_ASSUME_NONNULL_END
