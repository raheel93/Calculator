//
//  ButtonViewModel.h
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ButtonViewModelStyle.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ButtonViewModel <NSObject>

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) ButtonViewModelStyle style;

- (void)press;

@end

NS_ASSUME_NONNULL_END
