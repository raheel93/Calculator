//
//  ExpectationTable.m
//  CalculatorTests
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ExpectationTable.h"

#import "ExpectationTableKey.h"

@interface ExpectationTable ()

@property (nonatomic, readonly) NSMutableDictionary<ExpectationTableKey *, NSMutableArray<XCTestExpectation *> *> *expectationsByKey;

@end

@implementation ExpectationTable

- (instancetype)init {
    self = [super init];
    if (self) {
        _expectationsByKey = [NSMutableDictionary new];
    }
    return self;
}

#pragma mark - Public

- (void)addExpectation:(XCTestExpectation *)expectation forSelector:(SEL)selector arguments:(NSArray *)arguments {
    ExpectationTableKey *key = [[ExpectationTableKey alloc] initWithSelector:selector arguments:arguments];
    NSMutableArray<XCTestExpectation *> *expectations = self.expectationsByKey[key];
    if (!expectations) {
        expectations = [NSMutableArray new];
        self.expectationsByKey[key] = expectations;
    }
    [expectations addObject:expectation];
}

- (NSArray<XCTestExpectation *> *)expectationsForSelector:(SEL)selector arguments:(NSArray *)arguments {
    ExpectationTableKey *key = [[ExpectationTableKey alloc] initWithSelector:selector arguments:arguments];
    return self.expectationsByKey[key] ?: @[];
}

- (void)removeExpectationsForSelector:(SEL)selector arguments:(NSArray *)arguments {
    ExpectationTableKey *key = [[ExpectationTableKey alloc] initWithSelector:selector arguments:arguments];
    self.expectationsByKey[key] = nil;
}

@end
