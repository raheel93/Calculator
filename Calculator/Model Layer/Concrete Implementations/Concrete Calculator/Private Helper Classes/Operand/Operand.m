//
//  Operand.m
//  Calculator
//
//  Created by Raheel Merali on 6/1/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "Operand.h"

static NSString *const kNegativeSymbol = @"-";
static NSString *const kDecimalPointSymbol = @".";
static NSString *const kZeroSymbol = @"0";

@interface Operand ()

@property (nonatomic, readonly) NSMutableString *mutableString;
@property (nonatomic, getter=isZero) BOOL zero;
@property (nonatomic) BOOL containsDecimalPoint;

@end

@implementation Operand

- (instancetype)init {
    return [self initWithString:@""];
}

- (instancetype)initWithString:(NSString *)string {
    [self.class assertStringContainsOnlyValidCharacters:string];
    self = [super init];
    if (self) {
        _mutableString = [NSMutableString new];
        [self setUnderlyingString:string];
    }
    return self;
}

#pragma mark - Public

- (BOOL)isEmpty {
    return self.mutableString.length == 0;
}

- (NSString *)stringValue {
    return self.isEmpty ? kZeroSymbol : [self.mutableString copy];
}

- (void)appendDigit:(NSUInteger)digit {
    NSAssert(digit >= 0 && digit <= 9, @"%lu is not a digit", digit);
    
    NSString *digitString = @(digit).stringValue;
    
    if (self.isSingleCharacterZero) {
        self.mutableString.string = digitString;
    }
    else {
        [self.mutableString appendString:digitString];
    }
    
    self.zero = self.zero && (digit == 0);
}

- (void)appendDecimalPoint {
    if (self.containsDecimalPoint) {
        return;
    }
    
    if (self.isEmpty) {
        [self.mutableString appendString:kZeroSymbol];
    }
    
    [self.mutableString appendString:kDecimalPointSymbol];
    
    self.containsDecimalPoint = YES;
}

- (void)negate {
    if (self.isZero) {
        return;
    }
    
    if (self.isNegative) {
        [self.mutableString deleteCharactersInRange:NSMakeRange(0, kNegativeSymbol.length)];
    }
    else {
        [self.mutableString insertString:kNegativeSymbol atIndex:0];
    }
}

- (void)clear {
    [self setUnderlyingString:@""];
}

#pragma mark - NSObject

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p { stringValue = %@ }>", self.class, self, self.stringValue];
}

#pragma mark - Private

- (BOOL)isSingleCharacterZero {
    return [self.mutableString isEqualToString:kZeroSymbol];
}

- (BOOL)isNegative {
    return [self.mutableString hasPrefix:kNegativeSymbol];
}

- (void)setUnderlyingString:(NSString *)string {
    self.mutableString.string = string;
    
    self.zero = [self isZero:string];
    
    NSInteger indexOfDecimalPoint = [string rangeOfString:kDecimalPointSymbol].location;
    self.containsDecimalPoint = (indexOfDecimalPoint != NSNotFound);
}

- (BOOL)isZero:(NSString *)string {
    if (string.length == 0) {
        return YES;
    }
    
    NSMutableCharacterSet *allowedCharacters = [NSMutableCharacterSet new];
    [allowedCharacters addCharactersInString:kDecimalPointSymbol];
    [allowedCharacters addCharactersInString:kZeroSymbol];
    return [string stringByTrimmingCharactersInSet:allowedCharacters].length == 0;
}

+ (void)assertStringContainsOnlyValidCharacters:(NSString *)string {
    NSMutableCharacterSet *allowedCharacters = [NSMutableCharacterSet new];
    [allowedCharacters addCharactersInString:kNegativeSymbol];
    [allowedCharacters addCharactersInString:kDecimalPointSymbol];
    [allowedCharacters addCharactersInRange:NSMakeRange('0', 10)];
    
    NSString *illegalCharacters = [string stringByTrimmingCharactersInSet:allowedCharacters];
    NSAssert(illegalCharacters.length == 0, @"String contains illegal characters: %@", illegalCharacters);
}

@end
