//
//  ConcreteButtonPadViewTheme.h
//  Calculator
//
//  Created by Raheel Merali on 7/2/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ButtonPadViewTheme.h"

@class UITraitCollection;

NS_ASSUME_NONNULL_BEGIN

@interface ConcreteButtonPadViewTheme : NSObject <ButtonPadViewTheme>

- (void)updateWithTraitCollection:(UITraitCollection *)traitCollection;

@end

NS_ASSUME_NONNULL_END
