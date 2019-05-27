//
//  ConcreteCalculatorTestConstants.m
//  CalculatorTests
//
//  Created by Raheel Merali on 6/2/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculatorTestConstants.h"

@implementation ConcreteCalculatorTestConstants

- (NSString *)errorText {
    return @"Error";
}

- (NSString *)errorTextLocalizedInUSEnglish {
    return self.errorText;
}

- (NSString *)smallestSupportedInteger {
    // This is the smallest integer representable by NSDecimalNumber.
    return @"-3402823669209384634633746074317682114550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
}

- (NSString *)largestSupportedInteger {
    // This is the largest integer representable by NSDecimalNumber.
    return @"3402823669209384634633746074317682114550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
}

- (NSString *)largestSupportedIntegerLocalizedInUSEnglish {
    return @"3,402,823,669,209,384,634,633,746,074,317,682,114,550,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000";
}

- (NSString *)halfOfLargestSupportedInteger {
    return @"1701411834604692317316873037158841057275000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
}

- (NSString *)negativeHalfOfLargestSupportedInteger {
    return [@"-" stringByAppendingString:self.halfOfLargestSupportedInteger];
}

@end
