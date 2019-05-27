//
//  OperandStringValues.h
//  Calculator
//
//  Created by Raheel Merali on 8/17/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OperandStringValues : NSObject

@property (nonatomic, copy, readonly) NSString *stringValue;
@property (nonatomic, copy, readonly) NSString *localizedStringValue;

- (instancetype)initWithStringValue:(NSString *)stringValue
               localizedStringValue:(NSString *)localizedStringValue;

@end

NS_ASSUME_NONNULL_END
