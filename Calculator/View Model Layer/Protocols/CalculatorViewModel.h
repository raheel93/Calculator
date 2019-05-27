//
//  CalculatorViewModel.h
//  Calculator
//
//  Created by Raheel Merali on 6/23/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DisplayViewModel;
@protocol ButtonPadViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol CalculatorViewModel <NSObject>

@property (nonatomic, readonly) NSObject<DisplayViewModel> *displayViewModel;
@property (nonatomic, readonly) NSObject<ButtonPadViewModel> *buttonPadViewModel;

@end

NS_ASSUME_NONNULL_END
