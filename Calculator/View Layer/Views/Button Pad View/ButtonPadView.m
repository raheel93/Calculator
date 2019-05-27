//
//  ButtonPadView.m
//  Calculator
//
//  Created by Raheel Merali on 6/15/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ButtonPadView.h"

#import "GridView.h"
#import "ButtonPadGridConfiguration.h"
#import "ButtonPadViewModel.h"
#import "ButtonPadViewTheme.h"
#import "FloatComparison.h"

static void *kObservationContext = &kObservationContext;

@interface ButtonPadView ()

@property (nonatomic, readonly) NSObject<ButtonPadViewModel> *viewModel;
@property (nonatomic, readonly) NSObject<ButtonPadViewTheme> *theme;

@property (nonatomic, readonly) GridView *gridView;
@property (nonatomic) NSLayoutConstraint *aspectRatioConstraint;

@end

@implementation ButtonPadView

- (void)dealloc {
    [_theme removeObserver:self
                forKeyPath:@"spacing"
                   context:kObservationContext];
}

- (instancetype)initWithViewModel:(NSObject<ButtonPadViewModel> *)viewModel
                            theme:(NSObject<ButtonPadViewTheme> *)theme {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _viewModel = viewModel;
        _theme = theme;
        
        id<GridViewConfiguration> configuration = [[ButtonPadGridConfiguration alloc] initWithViewModel:viewModel themeProvider:theme.buttonViewThemeProvider];
        _gridView = [[GridView alloc] initWithConfiguration:configuration];
        _gridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_gridView];
        
        [_theme addObserver:self
                 forKeyPath:@"spacing"
                    options:NSKeyValueObservingOptionInitial
                    context:kObservationContext];
    }
    return self;
}

#pragma mark - UIView overrides

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateAspectRatioConstraint];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context != kObservationContext) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    [self updateSpacing];
}

- (void)updateSpacing {
    self.gridView.spacing = self.theme.spacing;
    [self updateAspectRatioConstraint];
}

#pragma mark - Aspect Ratio

- (void)updateAspectRatioConstraint {
    CGFloat idealAspectRatio = self.idealAspectRatio;
    
    if (calc_CGFloatEqualToFloat(self.aspectRatioConstraint.multiplier, idealAspectRatio)) {
        return;
    }
    
    self.aspectRatioConstraint.active = NO;
    
    self.aspectRatioConstraint = [self.heightAnchor constraintEqualToAnchor:self.widthAnchor multiplier:idealAspectRatio];
    
    // Let the constraint be broken if there isn't enough height available (e.g., in landscape on an iPhone).
    self.aspectRatioConstraint.priority = UILayoutPriorityDefaultLow;
    
    self.aspectRatioConstraint.active = YES;
}

/**
 Calculates the ideal height:width aspect ratio for this view.
 */
- (CGFloat)idealAspectRatio {
    CGFloat availableWidth = CGRectGetWidth(self.bounds);
    
    if (calc_CGFloatEqualToFloat(availableWidth, 0)) {
        return 0;
    }
    
    NSUInteger columnCount = self.viewModel.numberOfColumns;
    NSUInteger rowCount = self.viewModel.numberOfRows;
    if (columnCount == 0 || rowCount == 0) {
        return 0;
    }
    
    CGFloat totalHorizontalSpacing = self.theme.spacing * (columnCount - 1);
    CGFloat itemWidth = (availableWidth - totalHorizontalSpacing) / columnCount;
    
    CGFloat idealItemHeight = itemWidth;
    CGFloat idealViewHeight = rowCount * idealItemHeight + self.theme.spacing * (rowCount - 1);
    
    CGFloat idealAspectRatio = idealViewHeight / availableWidth;
    return idealAspectRatio;
}

@end
