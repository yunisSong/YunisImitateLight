//
//  AppDelegate.m
//  YunisImitateLight
//
//  Created by Yunis on 16/1/20.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import "AppDelegate.h"
#import "YunisTabbarController.h"
#import "YunisTabbarItem.h"

#import "HomeViewController.h"
#import "TopicViewController.h"
#import "UserViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupViewControllers];
    [self.window setRootViewController:self.viewController];
    [UIApplication sharedApplication].statusBarHidden = YES;
    return YES;
}
- (void)setupViewControllers {
    NSArray *arr = [NSArray arrayWithObjects:
                    @{@"oneimage": [UIImage imageNamed:@"CY_Libary"],
                      @"twoimage": [UIImage imageNamed:@"CY_Libary1"],
                      },
                    @{@"oneimage": [UIImage imageNamed:@"CY_contacts"],
                      @"twoimage": [UIImage imageNamed:@"CY_contacts1"],
                      },
                    
                    @{@"oneimage": [UIImage imageNamed:@"CY_Fenzhong"],
                      @"twoimage": [UIImage imageNamed:@"CY_Fenzhong1"],
                      },
                    @{@"oneimage": [UIImage imageNamed:@"CY_CenterIcon"],
                      @"twoimage": [UIImage imageNamed:@"CY_CenterIcon1"],
                      },
                    @{@"oneimage": [UIImage imageNamed:@"CY_Diy"],
                      @"twoimage": [UIImage imageNamed:@"CY_Diy1"],
                      },
                    nil];
    HomeViewController *firstViewController = [[HomeViewController alloc] init];
    firstViewController.title = @"首页";
    firstViewController.tabBarItem.title = @"首页";
    firstViewController.tabBarItem.image = [arr[0] objectForKey:@"oneimage"];
//    firstViewController.tabBarItem.selectedImage = [arr[0] objectForKey:@"twoimage"];
    UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    TopicViewController *secondViewController = [[TopicViewController alloc] init];
    secondViewController.title = @"话题";
    secondViewController.tabBarItem.title = @"话题";
    secondViewController.tabBarItem.image = [arr[1] objectForKey:@"oneimage"];
//    secondViewController.tabBarItem.selectedImage = [arr[1] objectForKey:@"twoimage"];
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    UserViewController *thirdViewController = [[UserViewController alloc] init];
    thirdViewController.title = @"我";
    thirdViewController.tabBarItem.title = @"我";
    thirdViewController.tabBarItem.image = [arr[2] objectForKey:@"oneimage"];
//    thirdViewController.tabBarItem.selectedImage = [arr[2] objectForKey:@"twoimage"];
    UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
//    
    YunisTabbarController *tabBarController = [[YunisTabbarController alloc] init];
    [tabBarController setViewControllers:@[firstNavigationController, secondNavigationController,
                                           thirdNavigationController]];
    self.viewController = tabBarController;
    
    [self customizeTabBarForController:tabBarController];
    
    
//    self.tabbarViewCtr.viewControllers = @[firstNavigationController,secondNavigationController,thirdNavigationController];
}
- (void)customizeTabBarForController:(YunisTabbarController *)tabBarController {
    NSArray *arr = [NSArray arrayWithObjects:
                    @{@"oneimage": [UIImage imageNamed:@"CY_Libary"],
                      @"twoimage": [UIImage imageNamed:@"CY_Libary1"],
                      },
                    @{@"oneimage": [UIImage imageNamed:@"CY_contacts"],
                      @"twoimage": [UIImage imageNamed:@"CY_contacts1"],
                      },
       
                    @{@"oneimage": [UIImage imageNamed:@"CY_Fenzhong"],
                      @"twoimage": [UIImage imageNamed:@"CY_Fenzhong1"],
                      },
                    @{@"oneimage": [UIImage imageNamed:@"CY_CenterIcon"],
                      @"twoimage": [UIImage imageNamed:@"CY_CenterIcon1"],
                      },
                    @{@"oneimage": [UIImage imageNamed:@"CY_Diy"],
                      @"twoimage": [UIImage imageNamed:@"CY_Diy1"],
                      },
                    nil];
    
    NSArray *titleArr = @[@"首页",@"话题",@"我",@"个人中心"];
    [[[tabBarController tabBar] items] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        YunisTabbarItem *item = obj;
        item.title = titleArr[idx];
        
        UIImage *selectedimage = [arr[idx] objectForKey:@"twoimage"];
        UIImage *unselectedimage = [arr[idx] objectForKey:@"oneimage"];
        item.backgroundSelectedImage = selectedimage;
        item.backgroundUnselectedImage = unselectedimage;
        if (idx == 0) {
            item.Selected = YES;
        }
    }];
}
@end
