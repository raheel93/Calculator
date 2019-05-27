//
//  GridView.h
//  Calculator
//
//  Created by Raheel Merali on 6/9/19.
//  Copyright © 2019 Raheel Merali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GridViewConfiguration;

@interface GridView : UIView

@property (nonatomic) CGFloat spacing;

- (instancetype)initWithConfiguration:(id<GridViewConfiguration>)configuration;

@end

@interface GridView (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
