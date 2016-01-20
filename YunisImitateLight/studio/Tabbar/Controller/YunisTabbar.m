//
//  YunisTabbar.m
//  YTX_NEW_CY
//
//  Created by 宋尚永 on 15-9-16.
//  Copyright (c) 2015年 yunis. All rights reserved.
//

#import "YunisTabbar.h"

@interface YunisTabbar()
{
    YunisTabbarItem *m_tempItem;
    YunisTabbarSelectIndex m_callback;
}
@end
@implementation YunisTabbar
- (instancetype)initWithBlock:(YunisTabbarSelectIndex)callback
{
    self = [super init];
    if (self) {
        m_callback = callback;
    }
    return self;
}
- (void)setItems:(NSArray *)items
{
    _items = items;
    
    [_items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [(YunisTabbarItem *)obj setSelected:NO];
        if (idx == 0) {
            m_tempItem = obj;
        }
        [obj addTarget:self action:@selector(setSelectedItem:) forControlEvents:UIControlEventTouchUpInside];
    }];
}
- (void)layoutSubviews
{
    [_items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self addSubview:obj];
        [(UIView *)obj setBackgroundColor:[UIColor clearColor]];
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.left.equalTo(idx * (CGRectGetWidth(self.frame)/_items.count));
            make.width.equalTo(CGRectGetWidth(self.frame)/_items.count);
        }];
    }];
    [super layoutSubviews];

}
- (void)setSelectedItem:(YunisTabbarItem *)selectedItem
{
    //通知到控制器  切换视图
    if (selectedItem == m_tempItem) {
        return;
    }
    [m_tempItem setSelected:NO];
    
    m_tempItem = selectedItem;
    [m_tempItem setSelected:YES];
    m_callback([self.items indexOfObject:selectedItem]);
    
}
@end
