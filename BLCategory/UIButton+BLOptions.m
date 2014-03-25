//
//  UIButton+BLOptions.m
//  BLCategory
//
//  Created by Loganathan on 25/03/14.
//  Copyright (c) 2014 Loganathan. All rights reserved.
//

#import "UIButton+BLOptions.h"
#import <objc/runtime.h>

@implementation UIButton (BLOptions)

#pragma mark - Setter and Getter methods.
-(void)setBorderColor:(UIColor *)borderColor{
    objc_setAssociatedObject(self, @"borderColor", borderColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UIColor *)borderColor{
    return objc_getAssociatedObject(self,  @"borderColor");
}

-(void)setFillColor:(UIColor *)fillColor{
    objc_setAssociatedObject(self, @"fillColor", fillColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UIColor *)fillColor{
    return  objc_getAssociatedObject(self, @"fillColor");
}

#pragma mark - Instance methods
-(BOOL)drawRoundedSidesWithBorderWidth:(CGFloat)borderWidth{
    if (self.buttonType == UIButtonTypeCustom) {
        //Button type should be custom
        CGFloat buttonWidth = self.frame.size.width;
        CGFloat buttonHeight = self.frame.size.height;
        CGFloat halfButtonHeight = buttonHeight/2;
        if (buttonWidth >= buttonHeight) {
            //Width should be >= Height
            NSLog(@"drawRoundedEdgesWithRadious, borderColor = %@", self.borderColor);
            self.backgroundColor = [UIColor clearColor];
            //Drawing
            
            UIBezierPath *path = [UIBezierPath bezierPath];
            CGPoint point = CGPointMake(buttonHeight/2, 0);
            
            [path moveToPoint:point];
            point.x = buttonWidth-halfButtonHeight;
            [path addLineToPoint:point];
            
            [path addArcWithCenter:CGPointMake(point.x, halfButtonHeight) radius:halfButtonHeight startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:YES];
            point.y = buttonHeight;
            point.x = halfButtonHeight;
            [path addLineToPoint:point];
            
            [path addArcWithCenter:CGPointMake(point.x, halfButtonHeight) radius:halfButtonHeight startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:YES];
            
            CAShapeLayer *layer = [CAShapeLayer layer];
            layer.path = [path CGPath];
            if (self.borderColor) {
                layer.strokeColor = [[self borderColor] CGColor];
            } else {
                layer.strokeColor = [[UIColor blackColor] CGColor];
            }
            
            if (self.fillColor) {
                layer.fillColor = [[self fillColor] CGColor];
            } else {
                layer.fillColor = [[UIColor clearColor] CGColor];
            }
            layer.lineWidth = borderWidth;
            
            
            
            [self.layer addSublayer:layer];
            
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}


@end
