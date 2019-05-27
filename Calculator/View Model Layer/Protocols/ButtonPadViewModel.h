//
//  ButtonPadViewModel.h
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ButtonViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol ButtonPadViewModel <NSObject>

@property (nonatomic, readonly) NSUInteger numberOfRows;
@property (nonatomic, readonly) NSUInteger numberOfColumns;

- (nullable NSObject<ButtonViewModel> *)buttonAtRow:(NSUInteger)rowIndex column:(NSUInteger)columnIndex;

@end

NS_ASSUME_NONNULL_END
