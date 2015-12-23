//
//  UIControl+PolygonTouchWithinSupport.m
//  testCircle
//
//  Created by yanghaha on 15/12/4.
//  Copyright © 2015年 yanghaha. All rights reserved.
//

#import "HYPolygonControl.h"
#import <objc/runtime.h>

//@implementation UIControl (PolygonTouchWithinSupport)

@implementation HYPolygonControl

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    [self updateBezierPath];
}

#pragma mark - Private

- (void)updateBezierPath {

    NSString *polygonPointsString = self.polygonPointsString;

    NSArray *points = [polygonPointsString componentsSeparatedByString:@";"];
    if (!points.count) {
        return;
    }

    if (points.count < 4) {
        return;
    }

    if (self.polygonBezierPath) {
        [self.polygonBezierPath removeAllPoints];
    }

    if (points.count == 4) {

        CGPoint topLeft = CGPointFromString(points[0]);
        CGPoint topRight = CGPointFromString(points[1]);
        CGPoint bottomLeft = CGPointFromString(points[3]);

        CGFloat widht = topRight.x - topLeft.x;
        CGFloat height = bottomLeft.y - topLeft.y;

        CGRect rect = CGRectMake(topLeft.x, topLeft.y, widht, height);

        if (self.shapeType == HYPolygonTypeRectangle) {
            self.polygonBezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:self.rectRadius];
        } else if (self.shapeType == HYPolygonTypeOval) {
            self.polygonBezierPath = [UIBezierPath bezierPathWithOvalInRect:rect];
        } else {
            NSAssert(self.shapeType<2, @"PolygonControl shapeType类型设置错误");
        }


    } else {
        for (int i=0; i<points.count; i++) {
            CGPoint point = CGPointFromString(points[i]);
            if (i==0) {
                [self.polygonBezierPath moveToPoint:point];
                continue;
            }
            [self.polygonBezierPath addLineToPoint:point];
        }
        [self.polygonBezierPath closePath];
    }

    self.polygonBezierPath.lineWidth = self.borderLineWidth;
    [self.polygonBezierPath stroke];

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = self.polygonBezierPath.CGPath;
    shapeLayer.strokeColor = self.borderLineColor.CGColor;
    shapeLayer.fillColor = [UIColor whiteColor].CGColor;

    [self.layer insertSublayer:shapeLayer atIndex:0];

//    [self.layer addSublayer:shapeLayer];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (![self.polygonBezierPath containsPoint:point]) {
        return NO;
    }

    return YES;
}

#pragma Setter && Getter

- (UIBezierPath *)polygonBezierPath {

    if (!_polygonBezierPath) {
        _polygonBezierPath = [UIBezierPath bezierPath];
    }

    return _polygonBezierPath;
}

@end
