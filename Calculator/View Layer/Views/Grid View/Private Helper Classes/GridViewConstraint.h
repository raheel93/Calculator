//
//  GridViewConstraint.h
//  Calculator
//
//  Created by Raheel Merali on 6/18/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GridViewConstraint : NSObject

@property (nonatomic, readonly) NSLayoutConstraint *underlyingConstraint;

- (instancetype)initWithUnderlyingConstraint:(NSLayoutConstraint *)constraint
                    affectedBySpacingChanges:(BOOL)affectedBySpacingChanges;

- (void)updateWithSpacing:(CGFloat)spacing;

@end

@interface GridViewConstraint (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
