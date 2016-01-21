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
    // Override point for customization after application launch.
    [self setupViewControllers];
    [self.window setRootViewController:self.viewController];
    
    
//    UITabBarController *T = [[UITabBarController alloc] init];
//    T.viewControllers = @[[[HomeViewController alloc] init],[[TopicViewController alloc] init],[[UserViewController alloc] init]];
//    self.window.rootViewController = T;
//    T.tabBar.backgroundColor = [UIColor clearColor];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)setupViewControllers {
    HomeViewController *firstViewController = [[HomeViewController alloc] init];
    firstViewController.title = @"首页";
    UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    TopicViewController *secondViewController = [[TopicViewController alloc] init];
    secondViewController.title = @"话题";
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    UserViewController *thirdViewController = [[UserViewController alloc] init];
    thirdViewController.title = @"我";
    UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
//
//    CYFenZhongViewCtr *thirdViewController1 = [[CYFenZhongViewCtr alloc] init];
//    thirdViewController1.title = @"分众";
//    UIViewController *thirdNavigationController1 = [[UINavigationController alloc]
//                                                    initWithRootViewController:thirdViewController1];
//    
//    
//    CYCenterViewCtr *thirdViewController2 = [[CYCenterViewCtr alloc] init];
//    thirdViewController2.title = @"个人中心";
//    UIViewController *thirdNavigationController2 = [[UINavigationController alloc]
//                                                    initWithRootViewController:thirdViewController2];
//    
    YunisTabbarController *tabBarController = [[YunisTabbarController alloc] init];
    [tabBarController setViewControllers:@[firstNavigationController, secondNavigationController,
                                           thirdNavigationController]];
    self.viewController = tabBarController;
    
    [self customizeTabBarForController:tabBarController];
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
