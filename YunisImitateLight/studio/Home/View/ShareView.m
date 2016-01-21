//
//  ShareView.m
//  YunisImitateLight
//
//  Created by Yunis on 16/1/21.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import "ShareView.h"
#import "UIView+Controller.h"

@interface ShareView()

@end
@implementation ShareView

#pragma mark - Life Cycle
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"initWithCoder");
        UILabel *t = ({
            UILabel *textLable               = [[UILabel alloc] initWithFrame:CGRectZero];
            textLable.font                   = [UIFont systemFontOfSize:15];
            textLable.text                   = @"点击测试弹框";
            textLable.userInteractionEnabled = YES;
            textLable.numberOfLines          = 0;// 不可少Label属性之一
            textLable.lineBreakMode          = NSLineBreakByCharWrapping;// 不可少Label
            textLable.textAlignment          = NSTextAlignmentLeft;
            textLable;
        });
        [self addSubview:t];
        
        [t mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(show)];
        [self addGestureRecognizer:tap];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         NSLog(@"initWithFrame");
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
         NSLog(@"init");
    }
    return self;
}

- (void)dealloc
{
     NSLog(@"%@ dealloc",[self class]);
}
#pragma mark - Public Method
//外部方法

#pragma mark - Private Method
//本类方法

#pragma mark - Delegate
//代理方法

#pragma mark - Event Response
//点击响应事件

- (void)show
{
    if ([self.viewController respondsToSelector:@selector(showShareHUDView)]) {
        [self.viewController performSelector:@selector(showShareHUDView)];
    }
}

#pragma mark - getters and setters
//初始化页面

@end
