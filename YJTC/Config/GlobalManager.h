//
//  GlobalManager.h
//  AC
//
//  Created by xujin on 2018/11/19.
//  Copyright © 2018年 Moli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSTabBarController.h"

NS_ASSUME_NONNULL_BEGIN
@class BSTabBarController,BSNavigationController;
@interface GlobalManager : NSObject

+ (instancetype)shareGlobalManager;

// 登录控制器
- (void)global_modalLogin;

// 获取根控制器
- (BSTabBarController *)global_rootViewControl;

// 获取当前控制器
- (UIViewController *)global_currentViewControl;
- (UINavigationController *)global_currentNavigationViewControl;

//登出控制器
- (void)global_modelLogout;


@end

NS_ASSUME_NONNULL_END
