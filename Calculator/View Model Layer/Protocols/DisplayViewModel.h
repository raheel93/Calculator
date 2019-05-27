//
//  DisplayViewModel.h
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DisplayViewModel <NSObject>

@property (nonatomic, copy, readonly) NSString *text;

@end

NS_ASSUME_NONNULL_END
