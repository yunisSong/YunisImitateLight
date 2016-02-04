//
//  RoundAnimationView.m
//  YunisImitateLight
//
//  Created by Yunis on 16/1/27.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import "RoundAnimationView.h"
/*
 1,圆弧动画
 2，透明度动画
 3，太阳位移动画
 4，太阳旋转动画
 5，显示日期动画
 6，判断是太阳还是月亮
 
 分割
 1，太阳月亮
 2，圆弧
 3，
 
 */
@implementation RoundAnimationView
- (instancetype)init{
    self =[super init];
    if (self) {
        self.drawRectValue = 1;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)setDrawRectValue:(float)drawRectValue
{
    _drawRectValue = drawRectValue;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    [KGrayColor set];
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    CGSize viewSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
    CGPoint startPoint = CGPointMake(0,self.frame.size.height);
    [aPath moveToPoint:startPoint];
    [aPath addLineToPoint:CGPointMake(viewSize.width,startPoint.y)];
    [aPath addLineToPoint:CGPointMake(startPoint.x+viewSize.width,0)];
    [aPath addQuadCurveToPoint:CGPointMake(0,0) controlPoint:CGPointMake(startPoint.x+(viewSize.width/2),self.frame.size.height*2*_drawRectValue )];
    [aPath fill];
    [aPath closePath];
    
}
@end
