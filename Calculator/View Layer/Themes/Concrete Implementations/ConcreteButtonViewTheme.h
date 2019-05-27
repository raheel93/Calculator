//
//  ConcreteButtonViewTheme.h
//  Calculator
//
//  Created by Raheel Merali on 7/2/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ButtonViewTheme.h"

@class UITraitCollection;

NS_ASSUME_NONNULL_BEGIN

@interface ConcreteButtonViewTheme : NSObject <ButtonViewTheme>

+ (instancetype)operatorTheme;
+ (instancetype)digitTheme;
+ (instancetype)digitModifierTheme;

- (void)updateWithTraitCollection:(UITraitCollection *)traitCollection;

@end

@interface ConcreteButtonViewTheme (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
