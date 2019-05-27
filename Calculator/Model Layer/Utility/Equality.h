//
//  Equality.h
//  Calculator
//
//  Created by Raheel Merali on 7/6/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_INLINE BOOL calc_areEqualObjects(id _Nullable a, id _Nullable b) {
    // The (a == b) check handles both `a` and `b` being nil.
    return a == b || [a isEqual:b];
}

NS_INLINE BOOL calc_areDifferentObjects(id _Nullable a, id _Nullable b) {
    return !calc_areEqualObjects(a, b);
}

NS_ASSUME_NONNULL_END
