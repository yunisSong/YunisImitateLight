//
//  YunisTabbarController.m
//  YTX_NEW_CY
//
//  Created by 宋尚永 on 15-9-16.
//  Copyright (c) 2015年 yunis. All rights reserved.
//

#import "YunisTabbarController.h"

#import "YunisTabbarItem.h"
@interface YunisTabbarController()
@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)YunisTabbar *tabBar;
@end
static float KTabbarHeigth = 50;
@implementation YunisTabbarController

#pragma mark
#pragma mark life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.tabBar];
    
//    [self performSelector:@selector(test) withObject:nil afterDelay:5];


}
- (void)test{
    [self setTabBarHidden:YES animated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //布局
    [self setTabBarHidden:self.isTabBarHidden animated:NO];

    [self setSelectedIndex:[self selectedIndex]];
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //监听事件
}
#pragma mark
#pragma mark Delegate
//代理方法

#pragma mark
#pragma mark event response
//点击响应事件

#pragma mark
#pragma mark private method
//本类方法
- (UIViewController *)selectedViewController {
    return [[self viewControllers] objectAtIndex:[self selectedIndex]];
}
- (void)setTabBarHidden:(BOOL)hidden animated:(BOOL)animated
{
    _tabBarHidden = hidden;
    
    __weak YunisTabbarController *weakSelf = self;
    
    void (^block)() = ^{
        CGSize viewSize = weakSelf.view.bounds.size;
        CGFloat tabBarStartingY = viewSize.height;
        CGFloat contentViewHeight = viewSize.height;
        CGFloat tabBarHeight = CGRectGetHeight([[weakSelf tabBar] frame]);
        
        if (!tabBarHeight) {
            tabBarHeight = KTabbarHeigth;
        }
        
        if (!hidden) {
            tabBarStartingY = viewSize.height - tabBarHeight;
//            contentViewHeight -= tabBarHeight;
            [[weakSelf tabBar] setHidden:NO];
        }
        
        [[weakSelf tabBar] setFrame:CGRectMake(0, tabBarStartingY, viewSize.width, tabBarHeight)];
        [[weakSelf contentView] setFrame:CGRectMake(0, 0, viewSize.width, contentViewHeight)];
    };
    
    void (^completion)(BOOL) = ^(BOOL finished){
        if (hidden) {
            [[weakSelf tabBar] setHidden:YES];
        }
    };
    
    if (animated) {
        [UIView animateWithDuration:0.24 animations:block completion:completion];
    } else {
        block();
        completion(YES);
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if (selectedIndex >= self.viewControllers.count) {
        return;
    }
    if ([self selectedViewController]) {
        [[self selectedViewController] willMoveToParentViewController:nil];
        [[[self selectedViewController] view] removeFromSuperview];
        [[self selectedViewController] removeFromParentViewController];
    }
    _selectedIndex = selectedIndex;
    [self setSelectedViewController:[[self viewControllers] objectAtIndex:selectedIndex]];
    [self addChildViewController:[self selectedViewController]];
    [[[self selectedViewController] view] setFrame:[[self contentView] bounds]];
    [[self contentView] addSubview:[[self selectedViewController] view]];
    [[self selectedViewController] didMoveToParentViewController:self];
    [self setNeedsStatusBarAppearanceUpdate];
    

}

- (void)setViewControllers:(NSArray *)viewControllers {
    if (_viewControllers && _viewControllers.count) {
        for (UIViewController *viewController in _viewControllers) {
            [viewController willMoveToParentViewController:nil];
            [viewController.view removeFromSuperview];
            [viewController removeFromParentViewController];
        }
    }
    
    if (viewControllers && [viewControllers isKindOfClass:[NSArray class]]) {
        _viewControllers = [viewControllers copy];
        NSMutableArray *tabBarItems = [[NSMutableArray alloc] init];
        
        for (int i= 0;i < viewControllers.count ; i ++) {
            YunisTabbarItem *tabBarItem = [[YunisTabbarItem alloc] init];
            [tabBarItems addObject:tabBarItem];
        }
        
        [[self tabBar] setItems:tabBarItems];

    } else {
        _viewControllers = nil;
    }
}

#pragma mark
#pragma mark getters and setters
//初始化页面
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        [_contentView setBackgroundColor:[UIColor whiteColor]];
        [_contentView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth|
                                           UIViewAutoresizingFlexibleHeight)];
        _contentView.backgroundColor = KViewBGColor;
    }
    return _contentView;
}
- (YunisTabbar *)tabBar{
    if (_tabBar == nil) {
        _tabBar = [[YunisTabbar alloc]initWithBlock:^(NSInteger index) {
            self.selectedIndex = index;
        }];
        _tabBar.backgroundColor = [UIColor colorWithWhite:.9 alpha:.9];
        [_tabBar setAutoresizingMask:(UIViewAutoresizingFlexibleWidth|
                                      UIViewAutoresizingFlexibleTopMargin|
                                      UIViewAutoresizingFlexibleLeftMargin|
                                      UIViewAutoresizingFlexibleRightMargin|
                                      UIViewAutoresizingFlexibleBottomMargin)];
    }
    
    return _tabBar;
}
@end
