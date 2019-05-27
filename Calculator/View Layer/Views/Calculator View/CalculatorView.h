//
//  CalculatorView.h
//  Calculator
//
//  Created by Raheel Merali on 6/23/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CalculatorViewModel;
@protocol CalculatorViewTheme;

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorView : UIView

- (instancetype)initWithViewModel:(NSObject<CalculatorViewModel> *)viewModel
                            theme:(NSObject<CalculatorViewTheme> *)theme;

@end

@interface CalculatorView (Unavailable)

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
