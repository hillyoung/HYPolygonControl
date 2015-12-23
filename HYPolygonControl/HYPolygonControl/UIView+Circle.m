//
//  UIView+Circle.m
//  testCircle
//
//  Created by yanghaha on 15/12/4.
//  Copyright © 2015年 yanghaha. All rights reserved.
//

#import "UIView+Circle.h"
#import <objc/runtime.h>

@implementation UIView (Circle)

- (void)setCircle:(BOOL)circle {
    objc_setAssociatedObject(self, @"circle", @(circle), OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (!circle) {
        self.layer.masksToBounds = NO;
        self.layer.cornerRadius = 0;
        self.layer.borderWidth = 0;
        self.layer.borderColor = nil;
    } else {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.cornerRadius;
        self.layer.borderWidth = self.borderWidth;
        self.layer.borderColor = self.borderColor.CGColor;
    }
}

- (BOOL)circle {
    BOOL circle = [objc_getAssociatedObject(self, @"circle") boolValue];
    return circle;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    objc_setAssociatedObject(self, @"cornerRadius", @(cornerRadius), OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (self.circle) {
        self.layer.cornerRadius = cornerRadius;
    }
}

- (CGFloat)cornerRadius {
    CGFloat cornerRadius = [objc_getAssociatedObject(self, @"cornerRadius") floatValue];
    return cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    objc_setAssociatedObject(self, @"borderWidth", @(borderWidth), OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (self.circle) {
        self.layer.borderWidth = borderWidth;
    }
}

- (CGFloat)borderWidth {
    CGFloat borderWidth = [objc_getAssociatedObject(self, @"borderWidth") floatValue];
    return borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    objc_setAssociatedObject(self, @"borderColor", borderColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (self.circle) {
        self.layer.borderColor = borderColor.CGColor;
    }
}

- (UIColor *)borderColor {
    UIColor *borderColor = objc_getAssociatedObject(self, @"borderColor");
    return borderColor;
}

@end
