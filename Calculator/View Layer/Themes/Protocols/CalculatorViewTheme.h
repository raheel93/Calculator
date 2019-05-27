//
//  CalculatorViewTheme.h
//  Calculator
//
//  Created by Raheel Merali on 7/2/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DisplayViewTheme;
@protocol ButtonPadViewTheme;

NS_ASSUME_NONNULL_BEGIN

@protocol CalculatorViewTheme <NSObject>

@property (nonatomic, readonly) NSDirectionalEdgeInsets margins;
@property (nonatomic, readonly) UIColor *backgroundColor;
@property (nonatomic, readonly) NSObject<DisplayViewTheme> *displayViewTheme;
@property (nonatomic, readonly) NSObject<ButtonPadViewTheme> *buttonPadViewTheme;

@end

NS_ASSUME_NONNULL_END
