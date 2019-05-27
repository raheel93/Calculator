//
//  ButtonViewTheme.h
//  Calculator
//
//  Created by Raheel Merali on 6/24/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIColor;
@class UIFont;

NS_ASSUME_NONNULL_BEGIN

@protocol ButtonViewTheme <NSObject>

@property (nonatomic, readonly) UIColor *backgroundColor;
@property (nonatomic, readonly) UIColor *textColor;
@property (nonatomic, readonly) UIFont *font;

@end

NS_ASSUME_NONNULL_END
