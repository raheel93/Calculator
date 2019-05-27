//
//  CalculatorView.m
//  Calculator
//
//  Created by Raheel Merali on 6/23/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "CalculatorView.h"

#import "CalculatorViewModel.h"
#import "CalculatorViewTheme.h"
#import "DisplayView.h"
#import "ButtonPadView.h"

static void *kObservationContext = &kObservationContext;

@interface CalculatorView ()

@property (nonatomic, readonly) NSObject<CalculatorViewModel> *viewModel;
@property (nonatomic, readonly) NSObject<CalculatorViewTheme> *theme;

@property (nonatomic, readonly) UIStackView *stackView;
@property (nonatomic, readonly) DisplayView *displayView;
@property (nonatomic, readonly) ButtonPadView *buttonPadView;

@end

@implementation CalculatorView

- (void)dealloc {
    [_theme removeObserver:self forKeyPath:@"margins" context:kObservationContext];
    [_theme removeObserver:self forKeyPath:@"backgroundColor" context:kObservationContext];
}

- (instancetype)initWithViewModel:(NSObject<CalculatorViewModel> *)viewModel theme:(NSObject<CalculatorViewTheme> *)theme {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _viewModel = viewModel;
        _theme = theme;
        
        [self addSubview:self.stackView];
        [self configureStackViewConstraints];
        
        [_theme addObserver:self forKeyPath:@"margins" options:NSKeyValueObservingOptionInitial context:kObservationContext];
        [_theme addObserver:self forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionInitial context:kObservationContext];
    }
    return self;
}

- (void)configureStackViewConstraints {
    UIStackView *stackView = self.stackView;
    UILayoutGuide *guide = self.layoutMarginsGuide;
    
    NSMutableArray<NSLayoutConstraint *> *constraints = [NSMutableArray new];
    [constraints addObject:[stackView.topAnchor constraintGreaterThanOrEqualToAnchor:guide.topAnchor]];
    [constraints addObject:[stackView.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor]];
    [constraints addObject:[stackView.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor]];
    [constraints addObject:[stackView.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor]];
    
    [NSLayoutConstraint activateConstraints:constraints];
}

#pragma mark - View Getters

@synthesize stackView = _stackView;

- (UIStackView *)stackView {
    if (!_stackView) {
        _stackView = [[UIStackView alloc] initWithArrangedSubviews:@[self.displayView, self.buttonPadView]];
        _stackView.translatesAutoresizingMaskIntoConstraints = NO;
        _stackView.axis = UILayoutConstraintAxisVertical;
        
        NSMutableArray<NSLayoutConstraint *> *constraints = [NSMutableArray new];
        [constraints addObject:[self.displayView.widthAnchor constraintEqualToAnchor:_stackView.widthAnchor]];
        [constraints addObject:[self.buttonPadView.widthAnchor constraintEqualToAnchor:_stackView.widthAnchor]];
        [NSLayoutConstraint activateConstraints:constraints];
    }
    return _stackView;
}

@synthesize displayView = _displayView;

- (DisplayView *)displayView {
    if (!_displayView) {
        _displayView = [[DisplayView alloc] initWithViewModel:self.viewModel.displayViewModel
                                                        theme:self.theme.displayViewTheme];
        _displayView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _displayView;
}

@synthesize buttonPadView = _buttonPadView;

- (ButtonPadView *)buttonPadView {
    if (!_buttonPadView) {
        _buttonPadView = [[ButtonPadView alloc] initWithViewModel:self.viewModel.buttonPadViewModel
                                                            theme:self.theme.buttonPadViewTheme];
        _buttonPadView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _buttonPadView;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context != kObservationContext) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    if ([keyPath isEqualToString:@"margins"]) {
        self.directionalLayoutMargins = self.theme.margins;
    }
    else if ([keyPath isEqualToString:@"backgroundColor"]) {
        self.backgroundColor = self.theme.backgroundColor;
    }
}

@end
