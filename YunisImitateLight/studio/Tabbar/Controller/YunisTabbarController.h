//
//  YunisTabbarController.h
//  YTX_NEW_CY
//
//  Created by 宋尚永 on 15-9-16.
//  Copyright (c) 2015年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YunisTabbar.h"
@interface YunisTabbarController : UIViewController

@property(nonatomic,strong)NSArray *viewControllers;

@property (nonatomic, weak) UIViewController *selectedViewController;
/**
 * The index of the view controller associated with the currently selected tab item.
 */
@property (nonatomic) NSUInteger selectedIndex;

/**
 * A Boolean value that determines whether the tab bar is hidden.
 */
@property (nonatomic, getter=isTabBarHidden) BOOL tabBarHidden;

@property (nonatomic, readonly) YunisTabbar *tabBar;
/**
 * Changes the visibility of the tab bar.
 */
- (void)setTabBarHidden:(BOOL)hidden animated:(BOOL)animated;

@end
