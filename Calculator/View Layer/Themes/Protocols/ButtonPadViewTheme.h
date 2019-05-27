//
//  ButtonPadViewTheme.h
//  Calculator
//
//  Created by Raheel Merali on 6/30/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonViewThemeProviding;

NS_ASSUME_NONNULL_BEGIN

@protocol ButtonPadViewTheme <NSObject>

@property (nonatomic, readonly) CGFloat spacing;
@property (nonatomic, readonly) NSObject<ButtonViewThemeProviding> *buttonViewThemeProvider;

@end

NS_ASSUME_NONNULL_END
