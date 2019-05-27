//
//  GridViewConstraint.m
//  Calculator
//
//  Created by Raheel Merali on 6/18/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "GridViewConstraint.h"

@interface GridViewConstraint ()

@property (nonatomic, readonly) BOOL affectedBySpacingChanges;

@end

@implementation GridViewConstraint

- (instancetype)initWithUnderlyingConstraint:(NSLayoutConstraint *)constraint
                    affectedBySpacingChanges:(BOOL)affectedBySpacingChanges {
    self = [super init];
    if (self) {
        _underlyingConstraint = constraint;
        _affectedBySpacingChanges = affectedBySpacingChanges;
    }
    return self;
}

#pragma mark - Public

- (void)updateWithSpacing:(CGFloat)spacing {
    if (!self.affectedBySpacingChanges) {
        return;
    }
    self.underlyingConstraint.constant = spacing;
}

@end
