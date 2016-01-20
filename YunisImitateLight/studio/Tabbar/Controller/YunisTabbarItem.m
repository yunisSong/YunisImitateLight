//
//  YunisTabbarItem.m
//  YTX_NEW_CY
//
//  Created by 宋尚永 on 15-9-16.
//  Copyright (c) 2015年 yunis. All rights reserved.
//

#import "YunisTabbarItem.h"
@interface YunisTabbarItem()

@property(nonatomic,strong)UIImageView *m_imageView;
@property(nonatomic,strong)UILabel *titleLab;
@end
@implementation YunisTabbarItem
#pragma mark
#pragma mark life cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.m_imageView];
        [self addSubview:self.titleLab];
        self.selectTitleColor = RGB(125, 0, 112);
        self.UnselectTitleColor = [UIColor grayColor];
        
    }
    return self;
}
- (void)layoutSubviews
{
    if (self.titleLab.text.length > 0) {
        [self.m_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@3);
            make.size.equalTo(CGSizeMake(CGRectGetHeight(self.frame) - 20, CGRectGetHeight(self.frame) - 20));
            make.centerX.equalTo(self);
        }];
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.equalTo(@15);
            
        }];
    }else
    {
        [self.m_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeZero);
        }];
    }

    [super layoutSubviews];
   
}
#pragma mark
#pragma mark Delegate
//代理方法

#pragma mark
#pragma mark event response
//点击响应事件
- (void)setBackgroundSelectedImage:(UIImage *)selectedImage withUnselectedImage:(UIImage *)unselectedImage {

    _backgroundSelectedImage = selectedImage;
    _backgroundUnselectedImage = unselectedImage;
}

- (void)setFinishedSelectedImage:(UIImage *)selectedImage withFinishedUnselectedImage:(UIImage *)unselectedImage {
    _backgroundSelectedImage = selectedImage;
    _backgroundUnselectedImage = unselectedImage;
    self.Selected = NO;
}
#pragma mark
#pragma mark private method
//本类方法
- (void)setSelectTitleColor:(UIColor *)selectTitleColor
{
    _selectTitleColor = selectTitleColor;
    self.titleLab.textColor = selectTitleColor;
}
- (void)setUnselectTitleColor:(UIColor *)UnselectTitleColor
{
    _UnselectTitleColor = UnselectTitleColor;
    self.titleLab.textColor = _UnselectTitleColor;
}
- (void)setBackgroundSelectedImage:(UIImage *)backgroundSelectedImage
{
    _backgroundSelectedImage = backgroundSelectedImage;
    if (self.Selected) {
        self.m_imageView.image = _backgroundSelectedImage;
    }
}
- (void)setBackgroundUnselectedImage:(UIImage *)backgroundUnselectedImage
{
    _backgroundUnselectedImage = backgroundUnselectedImage;
    if (!self.Selected) {
        self.m_imageView.image = _backgroundUnselectedImage;
    }
}
- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLab.text = _title;
}
- (void)setSelected:(BOOL)Selected
{
    _Selected = Selected;
    if (_Selected) {
        self.titleLab.textColor = self.selectTitleColor;
        self.m_imageView.image = self.backgroundSelectedImage;
    }else
    {
        self.titleLab.textColor = self.UnselectTitleColor;
        self.m_imageView.image = self.backgroundUnselectedImage;
    }
}
#pragma mark
#pragma mark getters and setters
//初始化页面
- (UIImageView *)m_imageView{
    if (_m_imageView == nil) {
        _m_imageView = [UIImageView new];
        _m_imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _m_imageView;
}
- (UILabel *)titleLab{
    if (_titleLab == nil) {
        _titleLab = [UILabel new];
        _titleLab.font = KSysFont13;
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    
    return _titleLab;
}
@end
