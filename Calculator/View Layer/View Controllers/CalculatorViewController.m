//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Raheel Merali on 5/27/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "CalculatorViewController.h"

#import "CalculatorView.h"
#import "ConcreteCalculatorViewTheme.h"

@interface CalculatorViewController ()

@property (nonatomic, readonly) NSObject<CalculatorViewModel> *viewModel;
@property (nonatomic, readonly) ConcreteCalculatorViewTheme *theme;

@end

@implementation CalculatorViewController

- (instancetype)initWithViewModel:(NSObject<CalculatorViewModel> *)viewModel {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _viewModel = viewModel;
        _theme = [ConcreteCalculatorViewTheme new];
        [_theme updateWithTraitCollection:self.traitCollection];
    }
    return self;
}

#pragma mark - UIViewController overrides

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)loadView {
    self.view = [[CalculatorView alloc] initWithViewModel:self.viewModel theme:self.theme];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self.theme updateWithTraitCollection:self.traitCollection];
}

@end
