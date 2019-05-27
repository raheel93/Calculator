//
//  ObjectCommunicationTester.m
//  CalculatorTests
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ObjectCommunicationTester.h"

#import "ExpectationTable.h"

@interface ObjectCommunicationTester ()

@property (nonatomic, readonly) ExpectationTable *expectationTable;

@end

@implementation ObjectCommunicationTester

- (instancetype)init {
    self = [super init];
    if (self) {
        _expectationTable = [ExpectationTable new];
    }
    return self;
}

#pragma mark - Public

- (XCTestExpectation *)expectationForSelectorToBePerformed:(SEL)selector
                                             withArguments:(NSArray *)arguments
                                                  testCase:(XCTestCase *)testCase {
    NSString *description = [self expectationDescriptionForSelector:selector arguments:arguments];
    XCTestExpectation *expectation = [testCase expectationWithDescription:description];
    [self.expectationTable addExpectation:expectation forSelector:selector arguments:arguments];
    return expectation;
}

- (void)fulfillExpectationsForSelector:(SEL)selector {
    [self fulfillExpectationsForSelector:selector arguments:@[]];
}

- (void)fulfillExpectationsForSelector:(SEL)selector arguments:(NSArray *)arguments {
    NSArray<XCTestExpectation *> *expectations = [self.expectationTable expectationsForSelector:selector arguments:arguments];
    [self.expectationTable removeExpectationsForSelector:selector arguments:arguments];
    for (XCTestExpectation *expectation in expectations) {
        [expectation fulfill];
    }
}

#pragma mark - Private

- (NSString *)expectationDescriptionForSelector:(SEL)selector arguments:(NSArray *)arguments {
    NSString *argumentsString = [NSString stringWithFormat:@"[%@]", [arguments componentsJoinedByString:@","]];
    return [NSString stringWithFormat:@"Expectation for %@ to be performed with arguments %@",
            NSStringFromSelector(selector),
            argumentsString];
}

@end
