//
//  OperandStringValues.m
//  Calculator
//
//  Created by Raheel Merali on 8/17/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "OperandStringValues.h"

@implementation OperandStringValues

- (instancetype)init {
    return [self initWithStringValue:@""
                localizedStringValue:@""];
}

- (instancetype)initWithStringValue:(NSString *)stringValue
               localizedStringValue:(NSString *)localizedStringValue {
    self = [super init];
    if (self) {
        _stringValue = [stringValue copy];
        _localizedStringValue = [localizedStringValue copy];
    }
    return self;
}

@end
