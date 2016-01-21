//
//  UIView+YunisFrame.h
//  YunisCategory
//
//  Created by Yunis on 15/12/3.
//  Copyright © 2015年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YunisFrame)
@property (nonatomic, assign) CGPoint Y_Origin;
@property (nonatomic, assign) CGSize Y_Size;

// shortcuts for positions
@property (nonatomic) CGFloat Y_CenterX;
@property (nonatomic) CGFloat Y_CenterY;


@property (nonatomic) CGFloat Y_Top;
@property (nonatomic) CGFloat Y_Bottom;
@property (nonatomic) CGFloat Y_Right;
@property (nonatomic) CGFloat Y_Left;

@property (nonatomic) CGFloat Y_Width;
@property (nonatomic) CGFloat Y_Height;
@end
