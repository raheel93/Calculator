//
//  GridViewConfiguration.h
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@class UIView;

@protocol GridViewConfiguration

@property (nonatomic, readonly) NSUInteger numberOfRows;
@property (nonatomic, readonly) NSUInteger numberOfColumns;

- (UIView *)viewAtRow:(NSUInteger)rowIndex column:(NSUInteger)columnIndex;

@end

NS_ASSUME_NONNULL_END
