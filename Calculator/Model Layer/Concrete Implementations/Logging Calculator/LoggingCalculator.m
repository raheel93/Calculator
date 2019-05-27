//
//  LoggingCalculator.m
//  Calculator
//
//  Created by Raheel Merali on 7/4/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "LoggingCalculator.h"

static void *kObservationContext = &kObservationContext;

@interface LoggingCalculator ()

@property (nonatomic, readonly) NSObject<Calculator> *baseCalculator;

@end

@implementation LoggingCalculator

- (void)dealloc {
    [_baseCalculator removeObserver:self
                         forKeyPath:@"display"
                            context:kObservationContext];
    
    [_baseCalculator removeObserver:self
                         forKeyPath:@"localizedDisplay"
                            context:kObservationContext];
}

- (instancetype)initWithBaseCalculator:(NSObject<Calculator> *)baseCalculator {
    self = [super init];
    if (self) {
        _baseCalculator = baseCalculator;
        [_baseCalculator addObserver:self
                          forKeyPath:@"display"
                             options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                             context:kObservationContext];
        [_baseCalculator addObserver:self
                          forKeyPath:@"localizedDisplay"
                             options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                             context:kObservationContext];
    }
    return self;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context != kObservationContext) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    id newValue = [self newValueInChangeDictionary:change];
    
    BOOL isInitialValue = change[NSKeyValueChangeOldKey] == nil;
    if (isInitialValue) {
        NSLog(@"Initial value of %@ is %@", keyPath, newValue);
    }
    else {
        NSLog(@"%@ changed to %@", keyPath, newValue);
    }
}

#pragma mark - Private

- (nullable id)newValueInChangeDictionary:(NSDictionary *)change {
    id newValue = change[NSKeyValueChangeNewKey];
    return [newValue isKindOfClass:NSNull.class] ? nil : newValue;
}

- (void)logSelector:(SEL)selector {
    NSLog(@"Called %@", NSStringFromSelector(selector));
}

- (void)logDigit:(NSUInteger)digit {
    NSLog(@"Entered %@", @(digit));
}

#pragma mark - Calculator

+ (NSSet<NSString *> *)keyPathsForValuesAffectingDisplay {
    return [NSSet setWithObject:@"baseCalculator.display"];
}

- (NSString *)display {
    return self.baseCalculator.display;
}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingLocalizedDisplay {
    return [NSSet setWithObject:@"baseCalculator.localizedDisplay"];
}

- (NSString *)localizedDisplay {
    return self.baseCalculator.localizedDisplay;
}

- (void)clear {
    [self logSelector:_cmd];
    [self.baseCalculator clear];
}

- (void)decimal {
    [self logSelector:_cmd];
    [self.baseCalculator decimal];
}

- (void)equals {
    [self logSelector:_cmd];
    [self.baseCalculator equals];
}

- (void)minus {
    [self logSelector:_cmd];
    [self.baseCalculator minus];
}

- (void)negate {
    [self logSelector:_cmd];
    [self.baseCalculator negate];
}

- (void)over {
    [self logSelector:_cmd];
    [self.baseCalculator over];
}

- (void)plus {
    [self logSelector:_cmd];
    [self.baseCalculator plus];
}

- (void)enterDigit:(NSUInteger)digit {
    [self logDigit:digit];
    [self.baseCalculator enterDigit:digit];
}

- (void)times {
    [self logSelector:_cmd];
    [self.baseCalculator times];
}

@end
