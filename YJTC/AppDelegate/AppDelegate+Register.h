//
//  AppDelegate+Register.h
//  AC
//
//  Created by xujin on 2018/11/17.
//  Copyright © 2018年 Moli. All rights reserved.
//

#import "AppDelegate.h"
#import "JPUSHService.h"
#import "OpenInstallSDK.h"
#import <WXApi.h>
NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (Register)<JPUSHRegisterDelegate,OpenInstallDelegate,WXApiDelegate>

//    动态域名配置ip请求地址
- (void)configServerAddress;

//注册微信 目的唤起小程序
- (void)registWX;

/// 注册友盟
- (void)registUMSocial;

/// 配置服务器HOST
//- (void)configServerAddress;

/// 书架初始化--app首次启动时候客户端调用加入推荐书
- (void)configInitShelfApi;

#pragma mark- OpenInstall 注册
- (void)registOpenInstallSDK:(NSDictionary *)launchOptions;

#pragma mark - 极光
/// 注册极光
- (void)app_registJpush:(NSDictionary *)launchOptions;

- (void)setupJPushWithLaunchOptions:(NSDictionary *)launchOptions;

#pragma mark-
#pragma mark 网易云信 IM 即时通讯
- (void)app_registNIMSDK;

- (void)registerPushService;

#pragma mark-
#pragma mark 有道评测
- (void)yd_TranslateInstance_AppKey;



@end

NS_ASSUME_NONNULL_END
