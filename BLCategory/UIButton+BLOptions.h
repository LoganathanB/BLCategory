//
//  UIButton+BLOptions.h
//  BLCategory
//
//  Created by Loganathan on 25/03/14.
//  Copyright (c) 2014 Loganathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BLOptions)

@property (nonatomic, retain) UIColor *borderColor;
@property (nonatomic, retain) UIColor *fillColor;

-(BOOL)drawRoundedSidesWithBorderWidth:(CGFloat)borderWidth;

@end
