//
//  FloatComparison.h
//  Calculator
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

NS_INLINE BOOL calc_CGFloatEqualToFloat(CGFloat a, CGFloat b) {
    return ABS(a - b) <= DBL_EPSILON;
}

NS_ASSUME_NONNULL_END
