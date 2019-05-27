//
//  NSString+CalculatorTestAdditions.m
//  CalculatorTests
//
//  Created by Raheel Merali on 7/7/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "NSString+CalculatorTestAdditions.h"

@implementation NSString (CalculatorTestAdditions)

- (BOOL)calc_matchesRegularExpression:(NSString *)regex {
    NSRange range = [self rangeOfString:regex options:NSRegularExpressionSearch];
    return range.location == 0 && range.length == self.length;
}

@end
