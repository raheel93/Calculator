//
//  DisplayView.h
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DisplayViewModel;
@protocol DisplayViewTheme;

NS_ASSUME_NONNULL_BEGIN

@interface DisplayView : UIView

- (instancetype)initWithViewModel:(NSObject<DisplayViewModel> *)viewModel
                            theme:(NSObject<DisplayViewTheme> *)theme;

@end

@interface DisplayView (Unavailable)

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
