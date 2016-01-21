//
//  UIView+YunisFrame.m
//  YunisCategory
//
//  Created by Yunis on 15/12/3.
//  Copyright © 2015年 yunis. All rights reserved.
//

#import "UIView+YunisFrame.h"

@implementation UIView (YunisFrame)
- (CGFloat)Y_Top
{
    return self.frame.origin.y;
}

- (void)setY_Top:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)Y_Right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setY_Right:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)Y_Bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setY_Bottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)Y_Left
{
    return self.frame.origin.x;
}

- (void)setY_Left:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)Y_Width
{
    return self.frame.size.width;
}

- (void)setY_Width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)Y_Height
{
    return self.frame.size.height;
}

- (void)setY_Height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - Shortcuts for frame properties

- (CGPoint)Y_Origin {
    return self.frame.origin;
}

- (void)setY_Origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)Y_Size {
    return self.frame.size;
}

- (void)setY_Size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
#pragma mark - Shortcuts for positions

- (CGFloat)Y_CenterX {
    return self.center.x;
}

- (void)setY_CenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)Y_CenterY {
    return self.center.y;
}

- (void)setY_CenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}
@end
