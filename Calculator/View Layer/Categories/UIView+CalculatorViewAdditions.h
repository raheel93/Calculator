//
//  UIView+CalculatorViewAdditions.h
//  Calculator
//
//  Created by Raheel Merali on 6/18/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CalculatorViewAdditions)

@property (nonatomic, readonly, getter=calc_isRightToLeft) BOOL calc_rightToLeft;

@end

NS_ASSUME_NONNULL_END
