//
//  YunisTabbarItem.h
//  YTX_NEW_CY
//
//  Created by 宋尚永 on 15-9-16.
//  Copyright (c) 2015年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunisTabbarItem : UIControl
- (void)setBackgroundSelectedImage:(UIImage *)selectedImage withUnselectedImage:(UIImage *)unselectedImage;
- (void)setFinishedSelectedImage:(UIImage *)selectedImage withFinishedUnselectedImage:(UIImage *)unselectedImage;
@property(nonatomic,strong)UIImage *backgroundSelectedImage;
@property(nonatomic,strong)UIImage *backgroundUnselectedImage;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)UIColor *selectTitleColor;
@property(nonatomic,strong)UIColor *UnselectTitleColor;
@property(nonatomic,readwrite)BOOL Selected;
@end
