//
//  YunisTabbar.h
//  YTX_NEW_CY
//
//  Created by 宋尚永 on 15-9-16.
//  Copyright (c) 2015年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YunisTabbarItem.h"
typedef void (^YunisTabbarSelectIndex)(NSInteger index);
@interface YunisTabbar : UIView
- (instancetype)initWithBlock:(YunisTabbarSelectIndex)callback;
- (void)setSelectedItem:(YunisTabbarItem *)selectedItem;
@property (nonatomic, copy) NSArray *items;
@end
