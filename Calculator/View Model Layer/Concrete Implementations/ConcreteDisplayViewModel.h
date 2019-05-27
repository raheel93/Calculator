//
//  ConcreteDisplayViewModel.h
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "DisplayViewModel.h"

@protocol Calculator;

NS_ASSUME_NONNULL_BEGIN

@interface ConcreteDisplayViewModel : NSObject <DisplayViewModel>

- (instancetype)initWithCalculator:(NSObject<Calculator> *)calculator;

@end

@interface ConcreteDisplayViewModel (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
