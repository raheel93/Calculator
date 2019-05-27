//
//  ConcreteButtonPadViewModel.m
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteButtonPadViewModel.h"

#import "ConcreteButtonViewModel.h"
#import "Calculator.h"

@interface ConcreteButtonPadViewModel ()

@property (nonatomic, readonly) NSObject<Calculator> *calculator;
@property (nonatomic, readonly) NSArray<NSArray<id> *> *buttons;
@property (nonatomic, readonly) NSNumberFormatter *numberFormatter;

@end

@implementation ConcreteButtonPadViewModel

- (instancetype)initWithCalculator:(NSObject<Calculator> *)calculator {
    self = [super init];
    if (self) {
        _calculator = calculator;
        _buttons = @[
                     @[[self makeClearButton],
                       [self makeNegateButton],
                       NSNull.null,
                       [self makeOverButton]],
                     @[[self makeButtonForDigit:7],
                       [self makeButtonForDigit:8],
                       [self makeButtonForDigit:9],
                       [self makeTimesButton]],
                     @[[self makeButtonForDigit:4],
                       [self makeButtonForDigit:5],
                       [self makeButtonForDigit:6],
                       [self makeMinusButton]],
                     @[[self makeButtonForDigit:1],
                       [self makeButtonForDigit:2],
                       [self makeButtonForDigit:3],
                       [self makePlusButton]],
                     @[[self makeButtonForDigit:0],
                       NSNull.null,
                       [self makeDecimalButton],
                       [self makeEqualsButton]]
                     ];
    }
    return self;
}

#pragma mark - ButtonPadViewModel

- (NSUInteger)numberOfRows {
    return self.buttons.count;
}

- (NSUInteger)numberOfColumns {
    return self.buttons.firstObject.count;
}

- (NSObject<ButtonViewModel> *)buttonAtRow:(NSUInteger)rowIndex column:(NSUInteger)columnIndex {
    id item = self.buttons[rowIndex][columnIndex];
    return item == NSNull.null ? nil : item;
}

#pragma mark - Private

- (NSObject<ButtonViewModel> *)makeClearButton {
    NSString *title = NSLocalizedString(@"AC", @"Clear button title");
    return [self makeDigitModifierButtonWithTitle:title actionHandler:^{
        [self.calculator clear];
    }];
}

- (NSObject<ButtonViewModel> *)makeNegateButton {
    NSString *title = NSLocalizedString(@"+/-", @"Negate button title");
    return [self makeDigitModifierButtonWithTitle:title actionHandler:^{
        [self.calculator negate];
    }];
}

- (NSObject<ButtonViewModel> *)makeOverButton {
    NSString *title = NSLocalizedString(@"÷", @"Over button title");
    return [self makeOperatorButtonWithTitle:title actionHandler:^{
        [self.calculator over];
    }];
}

- (NSObject<ButtonViewModel> *)makeTimesButton {
    NSString *title = NSLocalizedString(@"×", @"Times button title");
    return [self makeOperatorButtonWithTitle:title actionHandler:^{
        [self.calculator times];
    }];
}

- (NSObject<ButtonViewModel> *)makeMinusButton {
    NSString *title = NSLocalizedString(@"-", @"Minus button title");
    return [self makeOperatorButtonWithTitle:title actionHandler:^{
        [self.calculator minus];
    }];
}

- (NSObject<ButtonViewModel> *)makePlusButton {
    NSString *title = NSLocalizedString(@"+", @"Plus button title");
    return [self makeOperatorButtonWithTitle:title actionHandler:^{
        [self.calculator plus];
    }];
}

- (NSObject<ButtonViewModel> *)makeEqualsButton {
    NSString *title = NSLocalizedString(@"=", @"Equals button title");
    return [self makeOperatorButtonWithTitle:title actionHandler:^{
        return [self.calculator equals];
    }];
}

- (NSObject<ButtonViewModel> *)makeDecimalButton {
    NSString *title = self.numberFormatter.decimalSeparator;
    return [self makeDigitButtonWithTitle:title actionHandler:^{
        return [self.calculator decimal];
    }];
}

- (NSObject<ButtonViewModel> *)makeButtonForDigit:(NSUInteger)digit {
    return [self makeButtonForDigit:digit actionHandler:^{
        [self.calculator enterDigit:digit];
    }];
}

- (NSObject<ButtonViewModel> *)makeButtonForDigit:(NSUInteger)digit
                                    actionHandler:(void (^)(void))actionHandler {
    NSString *title = [self.numberFormatter stringFromNumber:@(digit)];
    return [self makeDigitButtonWithTitle:title
                            actionHandler:actionHandler];
}

- (NSObject<ButtonViewModel> *)makeOperatorButtonWithTitle:(NSString *)title
                                             actionHandler:(void (^)(void))actionHandler {
    return [[ConcreteButtonViewModel alloc] initWithTitle:title
                                                    style:ButtonViewModelStyleOperator
                                            actionHandler:actionHandler];
}

- (NSObject<ButtonViewModel> *)makeDigitModifierButtonWithTitle:(NSString *)title
                                                  actionHandler:(void (^)(void))actionHandler {
    return [[ConcreteButtonViewModel alloc] initWithTitle:title
                                                    style:ButtonViewModelStyleDigitModifier
                                            actionHandler:actionHandler];
}

- (NSObject<ButtonViewModel> *)makeDigitButtonWithTitle:(NSString *)title
                                          actionHandler:(void (^)(void))actionHandler {
    return [[ConcreteButtonViewModel alloc] initWithTitle:title
                                                    style:ButtonViewModelStyleDigit
                                            actionHandler:actionHandler];
}

@synthesize numberFormatter = _numberFormatter;

- (NSNumberFormatter *)numberFormatter {
    if (!_numberFormatter) {
        _numberFormatter = [NSNumberFormatter new];
        _numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        _numberFormatter.locale = NSLocale.currentLocale;
    }
    return _numberFormatter;
}

@end
