//
//  GridViewConstraintFactory.h
//  Calculator
//
//  Created by Raheel Merali on 6/10/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GridViewConstraint;
@class UIView;
@protocol GridViewConfiguration;

NS_ASSUME_NONNULL_BEGIN

@interface GridViewConstraintFactory : NSObject

@property (nonatomic, copy, readonly) NSArray<GridViewConstraint *> *constraints;

- (instancetype)initWithConfiguration:(id<GridViewConfiguration>)configuration
                                  row:(NSUInteger)rowIndex
                               column:(NSUInteger)columnIndex
                        containerView:(UIView *)containerView;

@end

@interface GridViewConstraintFactory (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
