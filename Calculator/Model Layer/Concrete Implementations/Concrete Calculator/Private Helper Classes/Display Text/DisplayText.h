//
//  DisplayText.h
//  Calculator
//
//  Created by Raheel Merali on 7/7/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Operand;

NS_ASSUME_NONNULL_BEGIN

@interface DisplayText : NSObject

@property (nonatomic, copy, readonly, nullable) NSString *text;
@property (nonatomic, copy, readonly, nullable) NSString *localizedText;

- (instancetype)initWithLocale:(NSLocale *)locale;

- (void)displayError;

- (void)updateWithOperand:(Operand *)operand;

@end

@interface DisplayText ()

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
