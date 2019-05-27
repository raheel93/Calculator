//
//  Calculator.h
//  Calculator
//
//  Created by Raheel Merali on 5/27/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Calculator <NSObject>

@property (nonatomic, copy, readonly) NSString *localizedDisplay;
@property (nonatomic, copy, readonly) NSString *display;

- (void)plus;
- (void)minus;
- (void)times;
- (void)over;

- (void)negate;
- (void)decimal;
- (void)clear;
- (void)equals;

- (void)enterDigit:(NSUInteger)digit;

@end

NS_ASSUME_NONNULL_END
