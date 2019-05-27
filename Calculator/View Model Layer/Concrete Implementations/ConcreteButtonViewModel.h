//
//  ConcreteButtonViewModel.h
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ButtonViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConcreteButtonViewModel : NSObject <ButtonViewModel>

- (instancetype)initWithTitle:(NSString *)title
                        style:(ButtonViewModelStyle)style
                actionHandler:(void (^)(void))actionHandler;

@end

@interface ConcreteButtonViewModel (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
