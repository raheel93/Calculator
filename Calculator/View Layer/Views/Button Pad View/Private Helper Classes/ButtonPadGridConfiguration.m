//
//  ButtonPadGridConfiguration.m
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ButtonPadGridConfiguration.h"

#import "ButtonPadViewModel.h"
#import "ConcreteButtonView.h"

#import <UIKit/UIKit.h>

@interface ButtonPadGridConfiguration ()

@property (nonatomic, readonly) NSObject<ButtonPadViewModel> *viewModel;
@property (nonatomic, readonly) NSObject<ButtonViewThemeProviding> *themeProvider;
@property (nonatomic, readonly) NSMutableDictionary<NSIndexPath *, UIView *> *cachedViewsByCoordinate;

@end

@implementation ButtonPadGridConfiguration

- (instancetype)initWithViewModel:(NSObject<ButtonPadViewModel> *)viewModel
                    themeProvider:(NSObject<ButtonViewThemeProviding> *)themeProvider {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
        _themeProvider = themeProvider;
        _cachedViewsByCoordinate = [NSMutableDictionary new];
    }
    return self;
}

#pragma mark - GridViewConfiguration

- (NSUInteger)numberOfColumns {
    return self.viewModel.numberOfColumns;
}

- (NSUInteger)numberOfRows {
    return self.viewModel.numberOfRows;
}

- (UIView *)viewAtRow:(NSUInteger)rowIndex column:(NSUInteger)columnIndex {
    NSIndexPath *coordinate = [self indexPathForRow:rowIndex column:columnIndex];
    UIView *view = self.cachedViewsByCoordinate[coordinate];
    if (view) {
        return view;
    }
    
    view = [self makeViewForRow:rowIndex column:columnIndex];
    self.cachedViewsByCoordinate[coordinate] = view;
    return view;
}

#pragma mark - Private

- (NSIndexPath *)indexPathForRow:(NSUInteger)rowIndex column:(NSUInteger)columnIndex {
    const NSUInteger indexes[] = { rowIndex, columnIndex };
    size_t length = sizeof(indexes) / sizeof(indexes[0]);
    return [NSIndexPath indexPathWithIndexes:indexes length:length];
}

- (UIView *)makeViewForRow:(NSUInteger)rowIndex column:(NSUInteger)columnIndex {
    NSObject<ButtonViewModel> *buttonViewModel = [self.viewModel buttonAtRow:rowIndex column:columnIndex];
    if (!buttonViewModel) {
        return [self makeEmptyView];
    }
    return [self makeButtonWithViewModel:buttonViewModel];
}

- (UIView *)makeEmptyView {
    UIView *view = [UIView new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

- (ConcreteButtonView *)makeButtonWithViewModel:(NSObject<ButtonViewModel> *)viewModel {
    ConcreteButtonView *button = [[ConcreteButtonView alloc] initWithViewModel:viewModel
                                                                 themeProvider:self.themeProvider];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    return button;
}

@end
