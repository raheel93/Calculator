//
//  ConcreteButtonView.m
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteButtonView.h"

#import "ButtonViewModel.h"
#import "ButtonViewTheme.h"
#import "ButtonViewThemeProviding.h"
#import "HighlightingButton.h"

static void *kObservationContext = &kObservationContext;

@interface ConcreteButtonView ()

@property (nonatomic, readonly) NSObject<ButtonViewModel> *viewModel;
@property (nonatomic, readonly) NSObject<ButtonViewTheme> *theme;
@property (nonatomic, readonly) UIButton *internalButton;

@end

@implementation ConcreteButtonView

- (void)dealloc {
    [_viewModel removeObserver:self
                    forKeyPath:@"title"
                       context:kObservationContext];
    
    for (NSString *keyPath in self.class.observedThemeKeyPaths) {
        [_theme removeObserver:self
                    forKeyPath:keyPath
                       context:kObservationContext];
    }
}

- (instancetype)initWithViewModel:(NSObject<ButtonViewModel> *)viewModel
                    themeProvider:(NSObject<ButtonViewThemeProviding> *)themeProvider {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
        _theme = [themeProvider themeForStyle:viewModel.style];
        
        _internalButton = [self makeInternalButton];
        _internalButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_internalButton];
        
        [_viewModel addObserver:self
                     forKeyPath:@"title"
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

- (UIButton *)makeInternalButton {
    UIButton *button = [HighlightingButton buttonWithType:UIButtonTypeSystem];
    button.layer.masksToBounds = YES;
    [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma mark - Private

- (void)press:(id)sender {
    [self.viewModel press];
}

#pragma mark - UIView overrides

- (void)layoutSubviews {
    [super layoutSubviews];
    self.internalButton.layer.cornerRadius = CGRectGetHeight(self.internalButton.frame) / 2;
}

#pragma mark - KVO

+ (NSSet<NSString *> *)observedThemeKeyPaths {
    return [NSSet setWithObjects:
            @"font",
            @"backgroundColor",
            @"textColor",
            nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context != kObservationContext) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    if (object == self.viewModel) {
        if ([keyPath isEqualToString:@"title"]) {
            [self.internalButton setTitle:self.viewModel.title forState:UIControlStateNormal];
        }
    }
    else if (object == self.theme) {
        if ([keyPath isEqualToString:@"font"]) {
            self.internalButton.titleLabel.font = self.theme.font;
        }
        else if ([keyPath isEqualToString:@"backgroundColor"]) {
            self.internalButton.backgroundColor = self.theme.backgroundColor;
        }
        else if ([keyPath isEqualToString:@"textColor"]) {
            [self.internalButton setTitleColor:self.theme.textColor forState:UIControlStateNormal];
        }
    }
}

@end
