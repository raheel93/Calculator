//
//  NSString+CalculatorTestAdditions.h
//  CalculatorTests
//
//  Created by Raheel Merali on 7/7/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CalculatorTestAdditions)

- (BOOL)calc_matchesRegularExpression:(NSString *)regex;

@end

NS_ASSUME_NONNULL_END
