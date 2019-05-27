//
//  AppDelegate.m
//  Calculator
//
//  Created by Raheel Merali on 5/27/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import "AppDelegate.h"

#import "CalculatorViewController.h"
#import "ConcreteCalculatorViewModel.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = [[CalculatorViewController alloc] initWithViewModel:[ConcreteCalculatorViewModel new]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
