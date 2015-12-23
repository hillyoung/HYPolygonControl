//
//  UIView+Circle.h
//  testCircle
//
//  Created by yanghaha on 15/12/4.
//  Copyright © 2015年 yanghaha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Circle)

#if TARGET_INTERFACE_BUILDER
#else
#endif

/**
 是否显示为圆圈
 */
@property (nonatomic) IBInspectable BOOL circle;
/**
 圆圈半径
 */
@property (nonatomic) IBInspectable CGFloat cornerRadius;
/**
 边框的宽度
 */
@property (nonatomic) IBInspectable CGFloat borderWidth;
/**
 边框的颜色
 */
@property (nonatomic) IBInspectable UIColor *borderColor;

@end
