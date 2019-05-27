//
//  ButtonPadView.h
//  Calculator
//
//  Created by Raheel Merali on 6/15/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonPadViewModel;
@protocol ButtonPadViewTheme;

NS_ASSUME_NONNULL_BEGIN

@interface ButtonPadView : UIView

- (instancetype)initWithViewModel:(NSObject<ButtonPadViewModel> *)viewModel
                            theme:(NSObject<ButtonPadViewTheme> *)theme;

@end

@interface ButtonPadView (Unavailable)

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
