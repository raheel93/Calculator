//
//  GridView.m
//  Calculator
//
//  Created by Raheel Merali on 6/9/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "GridView.h"

#import "GridViewConfiguration.h"
#import "GridViewConstraintFactory.h"
#import "GridViewConstraint.h"
#import "FloatComparison.h"

#import <UIKit/UIKit.h>

@interface GridView ()

@property (nonatomic, readonly) id<GridViewConfiguration> configuration;
@property (nonatomic, readonly) NSArray<GridViewConstraint *> *constraints;

@end

@implementation GridView

- (instancetype)initWithConfiguration:(id<GridViewConfiguration>)configuration {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _configuration = configuration;
        [self configureSubviews];
    }
    return self;
}

#pragma mark - Private

- (void)configureSubviews {
    NSMutableArray<GridViewConstraint *> *constraints = [NSMutableArray new];
    
    [self enumerateConfiguration:self.configuration usingBlock:^(UIView *view,
                                                                 NSUInteger rowIndex,
                                                                 NSUInteger columnIndex) {
        [self addSubview:view];
        
        GridViewConstraintFactory *factory = [[GridViewConstraintFactory alloc] initWithConfiguration:self.configuration
                                                                                                  row:rowIndex
                                                                                               column:columnIndex
                                                                                        containerView:self];
        [constraints addObjectsFromArray:factory.constraints];
    }];
    
    _constraints = [constraints copy];
    
    [NSLayoutConstraint activateConstraints:[constraints valueForKey:@"underlyingConstraint"]];
}

- (void)enumerateConfiguration:(id<GridViewConfiguration>)configuration
                    usingBlock:(void (^)(UIView *view,
                                         NSUInteger rowIndex,
                                         NSUInteger columnIndex))block {
    for (NSUInteger r = 0; r < self.configuration.numberOfRows; ++r) {
        for (NSUInteger c = 0; c < self.configuration.numberOfColumns; ++c) {
            UIView *view = [configuration viewAtRow:r column:c];
            block(view, r, c);
        }
    }
}

#pragma mark - Public

@synthesize spacing = _spacing;

- (void)setSpacing:(CGFloat)spacing {
    if (calc_CGFloatEqualToFloat(_spacing, spacing)) {
        return;
    }
    
    for (GridViewConstraint *constraint in self.constraints) {
        [constraint updateWithSpacing:spacing];
    }
}

@end
