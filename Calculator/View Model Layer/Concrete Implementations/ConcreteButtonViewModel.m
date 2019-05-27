//
//  ConcreteButtonViewModel.m
//  Calculator
//
//  Created by Raheel Merali on 6/16/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "ConcreteButtonViewModel.h"

@interface ConcreteButtonViewModel ()

@property (nonatomic, readonly) void (^actionHandler)(void);

@end

@implementation ConcreteButtonViewModel

@synthesize title = _title;
@synthesize style = _style;

- (instancetype)initWithTitle:(NSString *)title
                        style:(ButtonViewModelStyle)style
                actionHandler:(void (^)(void))actionHandler {
    self = [super init];
    if (self) {
        _title = [title copy];
        _style = [style copy];
        _actionHandler = actionHandler;
    }
    return self;
}

#pragma mark - ButtonViewModel

- (void)press {
    self.actionHandler();
}

@end
