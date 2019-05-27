//
//  ConcreteCalculator.m
//  Calculator
//
//  Created by Raheel Merali on 5/27/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteCalculator.h"

#import "Operand.h"
#import "DisplayText.h"
#import "ExpressionEvaluator.h"

typedef NS_ENUM(NSInteger, State) {
    StateEnteringFirstOperand,
    StateEnteringSecondOperand,
    StateProducedResult
};

@interface ConcreteCalculator ()

@property (nonatomic, readonly) DisplayText *displayText;
@property (nonatomic, readonly) ExpressionEvaluator *expressionEvaluator;
@property (nonatomic) State state;
@property (nonatomic) Operand *firstOperand;
@property (nonatomic) Operand *secondOperand;
@property (nonatomic) Operand *result;
@property (nonatomic) char selectedOperator;
@property (nonatomic) BOOL didError;

@end

@implementation ConcreteCalculator

- (instancetype)init {
    return [self initWithLocale:NSLocale.currentLocale];
}

- (instancetype)initWithLocale:(NSLocale *)locale {
    self = [super init];
    if (self) {
        _displayText = [[DisplayText alloc] initWithLocale:locale];
        _expressionEvaluator = [ExpressionEvaluator new];
        _firstOperand = [Operand new];
        _secondOperand = [Operand new];
        _result = [Operand new];
        [self clear];
    }
    return self;
}

#pragma mark - Calculator

- (void)enterDigit:(NSUInteger)digit {
    if (self.state == StateEnteringFirstOperand) {
        [self.firstOperand appendDigit:digit];
    }
    else if (self.state == StateEnteringSecondOperand) {
        [self.secondOperand appendDigit:digit];
    }
    else if (self.state == StateProducedResult) {
        [self prepareForNewFirstOperand];
        [self.firstOperand appendDigit:digit];
    }
    
    [self updateDisplay];
}

- (void)plus {
    [self selectOperator:'+'];
}

- (void)minus {
    [self selectOperator:'-'];
}

- (void)times {
    [self selectOperator:'*'];
}

- (void)over {
    [self selectOperator:'/'];
}

- (void)negate {
    if (self.state == StateEnteringFirstOperand) {
        [self.firstOperand negate];
    }
    else if (self.state == StateEnteringSecondOperand) {
        [self.secondOperand negate];
    }
    else if (self.state == StateProducedResult) {
        [self.result negate];
    }
    
    [self updateDisplay];
}

- (void)equals {
    if (self.didError) {
        self.state = StateProducedResult;
        [self updateDisplay];
        return;
    }
    
    // Use `result` as the first operator so you can enter 1+2, call equals to get a result of 3,
    // then call equals again to get 5 (3+2).
    Operand *firstOperand = self.result.empty ? self.firstOperand : self.result;
    
    // Use the first operand as the second so you can enter 5+, call equals, and get 10 (5+5).
    Operand *secondOperand = self.secondOperand.empty ? firstOperand : self.secondOperand;
    
    Operand *localResult = [self.expressionEvaluator resultOfExpressionWithFirstOperand:firstOperand
                                                                               operator:self.selectedOperator
                                                                          secondOperand:secondOperand];
    if (!localResult) {
        self.didError = YES;
    }
    else {
        self.result = localResult;
    }
    
    self.state = StateProducedResult;
    
    [self updateDisplay];
}

- (void)clear {
    self.selectedOperator = 0;
    self.state = StateEnteringFirstOperand;
    self.didError = NO;
    [self.firstOperand clear];
    [self.secondOperand clear];
    [self.result clear];
    [self updateDisplay];
}

- (void)decimal {
    if (self.state == StateEnteringFirstOperand) {
        [self.firstOperand appendDecimalPoint];
    }
    else if (self.state == StateEnteringSecondOperand) {
        [self.secondOperand appendDecimalPoint];
    }
    else if (self.state == StateProducedResult) {
        [self prepareForNewFirstOperand];
        [self.firstOperand appendDecimalPoint];
    }
    
    [self updateDisplay];
}

#pragma mark - Display KVO

+ (NSSet<NSString *> *)keyPathsForValuesAffectingDisplay {
    return [NSSet setWithObject:@"displayText.text"];
}

- (NSString *)display {
    return self.displayText.text;
}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingLocalizedDisplay {
    return [NSSet setWithObject:@"displayText.localizedText"];
}

- (NSString *)localizedDisplay {
    return self.displayText.localizedText;
}

#pragma mark - Private

- (void)selectOperator:(char)operator {
    if (self.state == StateEnteringSecondOperand) {
        if (!self.secondOperand.empty) {
            // Both the first and second operands are populated.
            // Consolidate them into a result so we can use `secondOperand` for entry of a new number.
            // For example, if the user enters 1+2, then calls plus, we'll consolidate 1 and 2 into a result of 3,
            // and then use secondOperand to capture the user's next number. If the user then enters 15 and calls
            // equals, we will perform result+15=18.
            [self equals];
        }
    }
    
    [self.secondOperand clear];
    self.state = StateEnteringSecondOperand;
    
    if (self.selectedOperator != operator) {
        self.selectedOperator = operator;
    }
    
    // Don't change the display. The display should continue to show whatever it was previously showing
    // until a new digit is entered or equals is called.
}

- (void)prepareForNewFirstOperand {
    // Clear `result` because `result` is implicitly used as the first operand if it's populated (see -equals).
    [self.result clear];
    [self.firstOperand clear];
    self.state = StateEnteringFirstOperand;
}

- (void)updateDisplay {
    if (self.state == StateEnteringFirstOperand) {
        [self.displayText updateWithOperand:self.firstOperand];
    }
    else if (self.state == StateEnteringSecondOperand) {
        [self.displayText updateWithOperand:self.secondOperand];
    }
    else if (self.state == StateProducedResult) {
        if (self.didError) {
            [self.displayText displayError];
        }
        else {
            [self.displayText updateWithOperand:self.result];
        }
    }
}

@end
