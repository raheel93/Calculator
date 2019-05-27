//
//  ExpectationTableKey.m
//  CalculatorTests
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ExpectationTableKey.h"

@interface ExpectationTableKey ()

@property (nonatomic, copy) NSString *selectorString;
@property (nonatomic, copy) NSArray *arguments;

@end

@implementation ExpectationTableKey

- (instancetype)initWithSelector:(SEL)selector arguments:(NSArray *)arguments {
    self = [super init];
    if (self) {
        _selectorString = NSStringFromSelector(selector);
        _arguments = [arguments copy];
    }
    return self;
}

#pragma mark - NSObject overrides

- (NSUInteger)hash {
    return self.selectorString.hash ^ self.arguments.hash;
}

- (BOOL)isEqual:(id)object {
    if (![object isMemberOfClass:ExpectationTableKey.class]) {
        return NO;
    }
    return [self isEqualToExpectationTableKey:object];
}

- (BOOL)isEqualToExpectationTableKey:(ExpectationTableKey *)other {
    return [self.selectorString isEqualToString:other.selectorString] && [self.arguments isEqualToArray:other.arguments];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

@end
