//
//  DisplayView.m
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "DisplayView.h"

#import "DisplayViewModel.h"
#import "DisplayViewTheme.h"
#import "UIView+CalculatorViewAdditions.h"

static void *kObservationContext = &kObservationContext;

@interface DisplayView ()

@property (nonatomic, readonly) NSObject<DisplayViewModel> *viewModel;
@property (nonatomic, readonly) NSObject<DisplayViewTheme> *theme;
@property (nonatomic, readonly) UILabel *label;

@end

@implementation DisplayView

- (void)dealloc {
    [_viewModel removeObserver:self forKeyPath:@"text" context:kObservationContext];
    
    for (NSString *keyPath in self.class.observedThemeKeyPaths) {
        [_theme removeObserver:self forKeyPath:keyPath context:kObservationContext];
    }
}

- (instancetype)initWithViewModel:(NSObject<DisplayViewModel> *)viewModel theme:(NSObject<DisplayViewTheme> *)theme {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _label = [self makeLabel];
        _label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_label];
        
        _viewModel = viewModel;
        _theme = theme;
        
        [_viewModel addObserver:self
                     forKeyPath:@"text"
                        options:NSKeyValueObservingOptionInitial
                        context:kObservationContext];
        
        for (NSString *keyPath in self.class.observedThemeKeyPaths) {
            [_theme addObserver:self
                     forKeyPath:keyPath
                        options:NSKeyValueObservingOptionInitial
                        context:kObservationContext];
        }
    }
    return self;
}

- (UILabel *)makeLabel {
    UILabel *label = [UILabel new];
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = self.calc_isRightToLeft ? NSTextAlignmentLeft : NSTextAlignmentRight;
    return label;
}

#pragma mark - UIView overrides

- (CGSize)intrinsicContentSize {
    return self.label.intrinsicContentSize;
}

#pragma mark - KVO

+ (NSSet<NSString *> *)observedThemeKeyPaths {
    return [NSSet setWithObjects:
            @"textColor",
            @"backgroundColor",
            @"font",
            @"fontMinimumScaleFactor",
            nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context != kObservationContext) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    if (object == self.viewModel) {
        if ([keyPath isEqualToString:@"text"]) {
            [self updateLabelText];
        }
    }
    else if (object == self.theme) {
        if ([keyPath isEqualToString:@"textColor"]) {
            [self updateLabelTextColor];
        }
        else if ([keyPath isEqualToString:@"backgroundColor"]) {
            [self updateBackgroundColor];
        }
        else if ([keyPath isEqualToString:@"font"]) {
            [self updateLabelFont];
        }
        else if ([keyPath isEqualToString:@"fontMinimumScaleFactor"]) {
            [self updateLabelMinimumScaleFactor];
        }
    }
}

- (void)updateLabelText {
    self.label.text = self.viewModel.text;
    [self invalidateIntrinsicContentSize];
}

- (void)updateLabelTextColor {
    self.label.textColor = self.theme.textColor;
}

- (void)updateBackgroundColor {
    self.backgroundColor = self.theme.backgroundColor;
}

- (void)updateLabelFont {
    self.label.font = self.theme.font;
    [self invalidateIntrinsicContentSize];
}

- (void)updateLabelMinimumScaleFactor {
    self.label.minimumScaleFactor = self.theme.fontMinimumScaleFactor;
    [self invalidateIntrinsicContentSize];
}

@end
