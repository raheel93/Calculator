//
//  ButtonViewThemeProviding.h
//  Calculator
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ButtonViewModelStyle.h"

@protocol ButtonViewTheme;

NS_ASSUME_NONNULL_BEGIN

@protocol ButtonViewThemeProviding <NSObject>

- (NSObject<ButtonViewTheme> *)themeForStyle:(ButtonViewModelStyle)style;

@end

NS_ASSUME_NONNULL_END
