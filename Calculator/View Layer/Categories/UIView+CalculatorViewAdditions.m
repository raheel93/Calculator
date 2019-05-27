//
//  UIView+CalculatorViewAdditions.m
//  Calculator
//
//  Created by Raheel Merali on 6/18/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "UIView+CalculatorViewAdditions.h"

@implementation UIView (CalculatorViewAdditions)

#pragma mark - Public

- (BOOL)calc_isRightToLeft {
    return self.calc_layoutDirection == UIUserInterfaceLayoutDirectionRightToLeft;
}

#pragma mark - Private

- (UIUserInterfaceLayoutDirection)calc_layoutDirection {
    return [self.class userInterfaceLayoutDirectionForSemanticContentAttribute:self.semanticContentAttribute];
}

@end
