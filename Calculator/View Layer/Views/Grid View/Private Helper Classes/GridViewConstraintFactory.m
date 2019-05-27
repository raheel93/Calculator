//
//  GridViewConstraintFactory.m
//  Calculator
//
//  Created by Raheel Merali on 6/10/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "GridViewConstraintFactory.h"

#import "GridViewConfiguration.h"
#import "GridViewConstraint.h"

#import <UIKit/UIKit.h>

@interface GridViewConstraintFactory ()

@property (nonatomic, readonly) id<GridViewConfiguration> configuration;
@property (nonatomic, readonly) NSUInteger row;
@property (nonatomic, readonly) NSUInteger column;
@property (nonatomic, readonly) UIView *containerView;

@end

@implementation GridViewConstraintFactory

- (instancetype)initWithConfiguration:(id<GridViewConfiguration>)configuration
                                  row:(NSUInteger)rowIndex
                               column:(NSUInteger)columnIndex
                        containerView:(UIView *)containerView {
    self = [super init];
    if (self) {
        _configuration = configuration;
        _row = rowIndex;
        _column = columnIndex;
        _containerView = containerView;
    }
    return self;
}

#pragma mark - Public

@synthesize constraints = _constraints;

- (NSArray<GridViewConstraint *> *)constraints {
    if (!_constraints) {
        _constraints = [self makeConstraints];
    }
    return _constraints;
}

#pragma mark - Private

- (NSArray<GridViewConstraint *> *)makeConstraints {
    NSMutableArray<GridViewConstraint *> *constraints = [NSMutableArray new];
    
    [constraints addObject:self.topConstraint];
    [constraints addObject:self.leadingConstraint];
    
    GridViewConstraint *trailingConstraint = self.trailingConstraint;
    if (trailingConstraint) {
        [constraints addObject:trailingConstraint];
    }
    
    GridViewConstraint *bottomConstraint = self.bottomConstraint;
    if (bottomConstraint) {
        [constraints addObject:bottomConstraint];
    }
    
    [constraints addObjectsFromArray:self.sizeConstraints];
    
    return [constraints copy];
}

- (GridViewConstraint *)topConstraint {
    NSLayoutConstraint *constraint = nil;
    BOOL affectedBySpacingChanges = NO;
    
    if (self.row == 0) {
        constraint = [self.containerView.topAnchor constraintEqualToAnchor:self.view.topAnchor];
    }
    else {
        UIView *aboveView = [self.configuration viewAtRow:self.row - 1 column:self.column];
        constraint = [self.view.topAnchor constraintEqualToAnchor:aboveView.bottomAnchor];
        affectedBySpacingChanges = YES;
    }
    
    constraint.identifier = @"V:[AboveView][View]";
    
    return [[GridViewConstraint alloc] initWithUnderlyingConstraint:constraint
                                           affectedBySpacingChanges:affectedBySpacingChanges];
}

- (GridViewConstraint *)leadingConstraint {
    NSLayoutConstraint *constraint = nil;
    BOOL affectedBySpacingChanges = NO;
    
    if (self.column == 0) {
        constraint = [self.containerView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor];
    }
    else {
        UIView *leadingView = [self.configuration viewAtRow:self.row column:self.column - 1];
        constraint = [self.view.leadingAnchor constraintEqualToAnchor:leadingView.trailingAnchor];
        affectedBySpacingChanges = YES;
    }
    
    constraint.identifier = @"H:[LeadingView][View]";
    
    return [[GridViewConstraint alloc] initWithUnderlyingConstraint:constraint
                                           affectedBySpacingChanges:affectedBySpacingChanges];
}

- (nullable GridViewConstraint *)trailingConstraint {
    NSUInteger lastColumnIndex = self.configuration.numberOfColumns - 1;
    if (self.column != lastColumnIndex) {
        return nil;
    }
    NSLayoutConstraint *constraint = [self.view.trailingAnchor constraintEqualToAnchor:self.containerView.trailingAnchor];
    constraint.identifier = @"H:[View][Container]";
    return [[GridViewConstraint alloc] initWithUnderlyingConstraint:constraint
                                           affectedBySpacingChanges:NO];
}

- (nullable GridViewConstraint *)bottomConstraint {
    NSUInteger lastRowIndex = self.configuration.numberOfRows - 1;
    if (self.row != lastRowIndex) {
        return nil;
    }
    NSLayoutConstraint *constraint = [self.view.bottomAnchor constraintEqualToAnchor:self.containerView.bottomAnchor];
    constraint.identifier = @"V:[View][Container]";
    return [[GridViewConstraint alloc] initWithUnderlyingConstraint:constraint
                                           affectedBySpacingChanges:NO];
}

- (NSArray<GridViewConstraint *> *)sizeConstraints {
    UIView *firstView = [self.configuration viewAtRow:0 column:0];
    return [self constraintsToMakeView:self.view sameSizeAsView:firstView];
}

- (NSArray<GridViewConstraint *> *)constraintsToMakeView:(UIView *)view sameSizeAsView:(UIView *)template {
    NSLayoutConstraint *widthConstraint = [view.widthAnchor constraintEqualToAnchor:template.widthAnchor];
    NSLayoutConstraint *heightConstraint = [view.heightAnchor constraintEqualToAnchor:template.heightAnchor];
    return @[[[GridViewConstraint alloc] initWithUnderlyingConstraint:widthConstraint affectedBySpacingChanges:NO],
             [[GridViewConstraint alloc] initWithUnderlyingConstraint:heightConstraint affectedBySpacingChanges:NO]];
}

- (UIView *)view {
    return [self.configuration viewAtRow:self.row column:self.column];
}

@end
