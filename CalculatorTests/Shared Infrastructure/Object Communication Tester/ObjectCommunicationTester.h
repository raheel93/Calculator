//
//  ObjectCommunicationTester.h
//  CalculatorTests
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <XCTest/XCTest.h>

NS_ASSUME_NONNULL_BEGIN

/**
 An object that provides facilities for expecting selector invocations.
 This object is meant to be used to test communication between objects.
 
 This object is intended to be subclassed by mock objects. For example, suppose
 you have a protocol called `FooProtocol` and a mock implementation called
 `MockFoo`. You could make `MockFoo` extend this class, and then your tests that
 use `MockFoo` could use the methods on this class to expect certain selectors on
 `MockFoo` to be invoked.
 
 `MockFoo` would use the subclassing methods to indicate when a given selector
 has been invoked, which would in turn fulfill any expectations matching that
 selector.
 */
@interface ObjectCommunicationTester : NSObject

/**
 Creates an expectation that will be fulfilled when the given selector is invoked.
 
 @param selector The selector to expect.
 @param arguments The expected arguments with which selector will be invoked.
                  Pass an empty array for selectors that take no arguments.
 @param testCase The test case that will use the expectation.
 @return An expectation that will be fulfilled when the specified selector
         is invoked with the specified arguments.
 */
- (XCTestExpectation *)expectationForSelectorToBePerformed:(SEL)selector
                                             withArguments:(NSArray *)arguments
                                                  testCase:(XCTestCase *)testCase XCT_WARN_UNUSED;

@end

/**
 Subclasses of this class should use these methods to indicate that a selector
 has been invoked. Calling these methods results in expectations for the specified
 selector being fulfilled.
 */
@interface ObjectCommunicationTester (Subclassing)

/**
 Convenience method that calls fulfillExpectationsForSelector:arguments: with an empty
 arguments array.
 */
- (void)fulfillExpectationsForSelector:(SEL)selector;

/**
 Fulfills expectations for the given selector to be invoked with the given arguments.
 Pass in an empty array if the selector does not take any arguments.
 */
- (void)fulfillExpectationsForSelector:(SEL)selector arguments:(NSArray *)arguments;

@end

NS_ASSUME_NONNULL_END
