//
//  ExpectationTableKey.h
//  CalculatorTests
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExpectationTableKey : NSObject <NSCopying>

- (instancetype)initWithSelector:(SEL)selector arguments:(NSArray *)arguments;

@end

@interface ExpectationTableKey (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
