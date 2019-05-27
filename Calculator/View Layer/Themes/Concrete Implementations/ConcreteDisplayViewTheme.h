//
//  ConcreteDisplayViewTheme.h
//  Calculator
//
//  Created by Raheel Merali on 7/2/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "DisplayViewTheme.h"

@class UITraitCollection;

NS_ASSUME_NONNULL_BEGIN

@interface ConcreteDisplayViewTheme : NSObject <DisplayViewTheme>

- (void)updateWithTraitCollection:(UITraitCollection *)traitCollection;

@end

NS_ASSUME_NONNULL_END
