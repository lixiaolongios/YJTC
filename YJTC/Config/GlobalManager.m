//
//  GlobalManager.m
//  AC
//
//  Created by xujin on 2018/11/19.
//  Copyright © 2018年 Moli. All rights reserved.
//

#import "GlobalManager.h"

@implementation GlobalManager

+ (instancetype)shareGlobalManager
{
    static GlobalManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil)
        {
            instance = [[GlobalManager alloc] init];
            
        }
    });
    return instance;
}


// 获取根控制器
- (BSTabBarController *)global_rootViewControl
{
    BSTabBarController *tabBar = (BSTabBarController *)AppDelegateWindow.rootViewController;
    return tabBar;
}

// 获取当前控制器
- (UIViewController *)global_currentViewControl
{
    return [self currentViewController];
}

- (UIViewController *) currentViewController {
    BSTabBarController *vc = [[GlobalManager shareGlobalManager] global_rootViewControl];
    return [self findBestViewController:vc];
}

- (UINavigationController *)global_currentNavigationViewControl
{
    return [self global_currentViewControl].navigationController;
}







// 获取当前控制器
- (UIViewController *) findBestViewController:(UIViewController *)vc {
    if (vc.presentedViewController) {
        // Return presented view controller
        return [self findBestViewController:vc.presentedViewController];
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        // Return right hand side
        UISplitViewController* svc = (UISplitViewController*) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.viewControllers.lastObject];
        else
            return vc;
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        // Return top view
        UINavigationController* svc = (UINavigationController*) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.topViewController];
        else
            return vc;
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        // Return visible view
        UITabBarController* svc = (UITabBarController*) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.selectedViewController];
        else
            return vc;
    } else {
        // Unknown view controller type, return last child view controller
        return vc;
    }
}




@end
