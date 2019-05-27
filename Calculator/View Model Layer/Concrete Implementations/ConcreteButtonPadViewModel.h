//
//  ConcreteButtonPadViewModel.h
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ButtonPadViewModel.h"

@protocol Calculator;

NS_ASSUME_NONNULL_BEGIN

@interface ConcreteButtonPadViewModel : NSObject <ButtonPadViewModel>

- (instancetype)initWithCalculator:(NSObject<Calculator> *)calculator;

@end

@interface ConcreteButtonPadViewModel (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
