//
//  ConcreteButtonView.h
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonViewModel;
@protocol ButtonViewThemeProviding;

NS_ASSUME_NONNULL_BEGIN

@interface ConcreteButtonView : UIView

- (instancetype)initWithViewModel:(NSObject<ButtonViewModel> *)viewModel
                    themeProvider:(NSObject<ButtonViewThemeProviding> *)themeProvider;

@end

@interface ConcreteButtonView (Unavailable)

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
