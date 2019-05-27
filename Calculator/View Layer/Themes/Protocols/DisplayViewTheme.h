//
//  DisplayViewTheme.h
//  Calculator
//
//  Created by Raheel Merali on 6/30/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DisplayViewTheme <NSObject>

@property (nonatomic, readonly) UIColor *textColor;
@property (nonatomic, readonly) UIColor *backgroundColor;
@property (nonatomic, readonly) UIFont *font;
@property (nonatomic, readonly) CGFloat fontMinimumScaleFactor;

@end

NS_ASSUME_NONNULL_END
