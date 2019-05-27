//
//  ButtonPadGridConfiguration.h
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "GridViewConfiguration.h"

@protocol ButtonPadViewModel;
@protocol ButtonViewThemeProviding;

NS_ASSUME_NONNULL_BEGIN

@interface ButtonPadGridConfiguration : NSObject <GridViewConfiguration>

- (instancetype)initWithViewModel:(NSObject<ButtonPadViewModel> *)viewModel
                    themeProvider:(NSObject<ButtonViewThemeProviding> *)themeProvider;

@end

@interface ButtonPadGridConfiguration (Unavailable)

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
