//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Raheel Merali on 5/27/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CalculatorViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorViewController : UIViewController

- (instancetype)initWithViewModel:(NSObject<CalculatorViewModel> *)viewModel;

@end

@interface CalculatorViewController (Unavailable)

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
