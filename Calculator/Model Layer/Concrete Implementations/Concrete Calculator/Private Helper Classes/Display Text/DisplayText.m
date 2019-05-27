//
//  DisplayText.m
//  Calculator
//
//  Created by Raheel Merali on 7/7/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "DisplayText.h"

#import "Equality.h"
#import "OperandLocalizer.h"
#import "OperandStringValues.h"

@interface DisplayText ()

@property (nonatomic, readonly) OperandLocalizer *operandLocalizer;

@end

@implementation DisplayText

- (instancetype)initWithLocale:(NSLocale *)locale {
    self = [super init];
    if (self) {
        _operandLocalizer = [[OperandLocalizer alloc] initWithLocale:locale];
    }
    return self;
}

- (void)displayError {
    [self updateWithText:@"Error"
           localizedText:NSLocalizedString(@"Error", @"Text on the calculator display when a calculation error occurs.")];
}

- (void)updateWithOperand:(Operand *)operand {
    OperandStringValues *strings = [self.operandLocalizer stringValuesForOperand:operand];
    [self updateWithText:strings.stringValue
           localizedText:strings.localizedStringValue];
}

#pragma mark - Private

- (void)updateWithText:(NSString *)text localizedText:(NSString *)localizedText {
    BOOL textChanged = calc_areDifferentObjects(self.text, text);
    BOOL localizedTextChanged = calc_areDifferentObjects(self.localizedText, localizedText);
    
    if (textChanged) {
        [self willChangeValueForKey:@"text"];
    }
    
    if (localizedTextChanged) {
        [self willChangeValueForKey:@"localizedText"];
    }
    
    if (textChanged) {
        _text = [text copy];
    }
    
    if (localizedTextChanged) {
        _localizedText = [localizedText copy];
    }
    
    // Send the `didChange` notifications in reverse order.
    
    if (localizedTextChanged) {
        [self didChangeValueForKey:@"localizedText"];
    }
    
    if (textChanged) {
        [self didChangeValueForKey:@"text"];
    }
}

@end
