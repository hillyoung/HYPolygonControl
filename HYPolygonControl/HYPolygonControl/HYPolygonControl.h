//
//  UIControl+PolygonTouchWithinSupport.h
//  testCircle
//
//  Created by yanghaha on 15/12/4.
//  Copyright © 2015年 yanghaha. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    HYPolygonTypeRectangle,
    HYPolygonTypeOval,
    HYPolygonTypeMutli
} HYPolygonType;

//@interface UIControl (PolygonTouchWithinSupport)
@interface  HYPolygonControl:UIControl


@property (strong, nonatomic) UIBezierPath *polygonBezierPath;
/**
 多个point之间用’;‘隔开,格式为{x,y};{x,y}
 PolygonTypeRectangle，PolygonTypeOval 必须是四个点，而且四点的顺序依次是
 左上，右上，右下，坐下四个角的点,顺时针
 */
@property (copy, nonatomic) IBInspectable NSString *polygonPointsString;

/**
 设置形状
 */
#if TARGET_INTERFACE_BUILDER
@property (nonatomic) IBInspectable NSUInteger shapeType;
#else
@property (nonatomic) HYPolygonType shapeType;
#endif

@property (nonatomic) IBInspectable CGFloat rectRadius;

@property (nonatomic) IBInspectable CGFloat borderLineWidth;

@property (nonatomic) IBInspectable UIColor *borderLineColor;

@end
