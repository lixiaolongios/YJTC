//
//  AppDelegate+Register.m
//  AC
//
//  Created by xujin on 2018/11/17.
//  Copyright © 2018年 Moli. All rights reserved.
//

#import "AppDelegate+Register.h"
#import <UMShare/UMShare.h>
#import <UMCommon/UMCommon.h>
#import "BookcaseApi.h"
#import "UITabBar+Badge.h"
#import "MOLWebViewController.h"
#import "MOLSystemModel.h"
#import "SystemSubModel.h"
#import "RoomModel.h"
#import "ChatRoomViewController.h"
#import <NIMSDK/NIMSDK.h>
#import "NTESCustomAttachmentDecoder.h"
#import "NIMKit.h"
#import "NTESCellLayoutConfig.h"
#import <XGPush.h>
#import "CWFlieManager.h"

#import "AppDelegate+RootViewController.h"

#import "CampoManager.h"

//#import "SpeechEvaluateSDK.h"
#import "MOLAppStartRequest.h"


// iOS10 注册 APNs 所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

//#define APPStore @"App Store"
//#define UM_KEY  @"5c91e9cc3fc195dd4d000f33"
//#define UM_WX_KEY @"wx6eaa2fa10e8c1bbd"
//#define UM_WX_SER @"4127c382f95f195a54628ebb734afda0"
//#define UM_WB_KEY @"2170772809"
//#define UM_WB_SER @"d984b3d7cc0866bb6a0eaeaed90c6e1a"
//#define UM_QQ_KEY @"1108032066"
//
//#define UM_FB_KEY @"474282446851328"
//#define UM_FB_SER @"6c7c6a45c6f9ea07de8304967851d0fd"



@interface AppDelegate (Register)<XGPushDelegate>

@end




@implementation AppDelegate (Register)

//    动态域名配置ip请求地址

- (void)requestErrorHandle:(NSString *)url{
    if ([url isEqualToString:[self switchFirstUrl]]) {
        [self lxlswitchGateway:[self switchSecondUrl]];
    }else{
        #ifdef DEBUG
        [CampoManager sharedManager].apiDomain = [NSString stringWithString:DEBUG_SERVICE_HOST];
              // 测试
            // config.cdnUrl = @"";
        #else
        [CampoManager sharedManager].apiDomain = [NSString stringWithString:RELEASE_SERVICE_HOST];//RELEASE_SERVICE_HOST;
              // 正式
            // config.cdnUrl = @"";
        #endif
    
        dispatch_semaphore_signal([CampoManager sharedManager]._semaphore);
        
    }
}

- (NSString *)switchFirstUrl
{
    NSString *url;
    #ifdef DEBUG
       url = @"http://47.92.147.81:8601/api/config/domain/apiDomain";  // 测试
        // config.cdnUrl = @"";
    #else
        url = @"http://47.92.160.160:8601/api/config/domain/apiDomain";  // 正式
        // config.cdnUrl = @"";
    #endif
    return url;
}


- (NSString *)switchSecondUrl
{
    NSString *url;
    #ifdef DEBUG
       url = @"http://47.92.147.1:8601/api/config/domain/apiDomain";  // 测试
        // config.cdnUrl = @"";
    #else
        url = @"http://47.92.87.1:8601/api/config/domain/apiDomain";  // 正式
        // config.cdnUrl = @"";
    #endif
    return url;
}

- (void)lxlswitchGateway:(NSString *)httpStr{
   
    
    NSDate *requestDate =[NSDate date];
   __block typeof(self) weakSelf = self;

    NSURL *httpUrl = [NSURL URLWithString:httpStr];
    NSMutableURLRequest *request_post = [NSMutableURLRequest requestWithURL:httpUrl];
    [request_post setHTTPMethod:@"POST"];
    [request_post setTimeoutInterval:1.2];
    
    
    NSURLSession *session_post = [NSURLSession sharedSession];

    
    NSURLSessionDataTask *task_post = [[session_post dataTaskWithRequest:request_post completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    

        if (error) {//错误❌
            double min = [[NSDate date] timeIntervalSinceDate:requestDate];
        //    NSLog(@"超时时间^^^^^^^%lf",min);
            [weakSelf requestErrorHandle:httpStr];
            
        }else{
            
            double min = [[NSDate date] timeIntervalSinceDate:requestDate];
            
      //      NSLog(@"请求时间^^^^^^^%lf",min);
            
            NSError *error;
            NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            if (!jsonResponse) {//错误❌
               [weakSelf requestErrorHandle:httpStr];
                
            }else{//成功
                
                if ([jsonResponse[@"code"] integerValue] == SUCCESS_REQUEST) {
                    
                    if (jsonResponse[@"resBody"]) {
                        
                        if ([jsonResponse[@"resBody"][@"apiDomain"] length] &&
                            [jsonResponse[@"resBody"][@"webDomain"] length]) {
                            
                            [CampoManager sharedManager].apiDomain =jsonResponse[@"resBody"][@"apiDomain"];

                            [CampoManager sharedManager].webDomain =jsonResponse[@"resBody"][@"webDomain"];
                            
                           

                          //  NSLog(@"%@\n%@",jsonResponse[@"resBody"]);
                            dispatch_semaphore_signal([CampoManager sharedManager]._semaphore);
                            
                        }else{
                            [weakSelf requestErrorHandle:httpStr];
                        }
                        
                    }else{
                        [weakSelf requestErrorHandle:httpStr];
                    }
                    
                    
                }else{
                    [weakSelf requestErrorHandle:httpStr];
                }
                
            }
            
        }

        
    }] copy];
    
    
    [task_post resume];

    
}

/// 配置服务器HOST
- (void)configServerAddress{
    
    //    动态域名配置ip请求地址
    //
    //    开发环境
    //    http://47.92.147.81:8601/config/domain/apiDomain
    //    http://47.92.147.1:8601/config/domain/apiDomain
    //
    //    生产环境
    //    http://47.92.160.160:8601/config/domain/apiDomain
    //    http://47.92.87.1:8601/config/domain/apiDomain
    
    //切换网络
    
    [CampoManager sharedManager]._semaphore = dispatch_semaphore_create(0);
    
    [self lxlswitchGateway:[self switchFirstUrl]];
  
    dispatch_semaphore_wait([CampoManager sharedManager]._semaphore, DISPATCH_TIME_FOREVER);

    
        
   YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];

   if ([CampoManager sharedManager].apiDomain.length) {
       config.baseUrl =[CampoManager sharedManager].apiDomain;  // 测试
   }else{
       #ifdef DEBUG
           config.baseUrl = DEBUG_SERVICE_HOST;  // 测试
           // config.cdnUrl = @"";
       #else
           config.baseUrl = RELEASE_SERVICE_HOST;  // 正式
           // config.cdnUrl = @"";
       #endif
   }
                 
}


//注册微信 目的唤起小程序
- (void)registWX
{
    [WXApi registerApp:UM_WX_KEY universalLink:UNIVERSALLINK];
//    NSLog(@"%d",[WXApi registerApp:UM_WX_KEY]);
}

/// 注册友盟
- (void)registUMSocial{
    // U-Share 平台设置
    [self confitUShareSettings];
    [self configUSharePlatforms];
    
#ifdef DEBUG
//    //开发者需要显式的调用此函数，日志系统才能工作
//    [UMCommonLogManager setUpUMCommonLogManager];
//    [UMConfigure setLogEnabled:YES];//设置打开日志
#endif
}

- (void)confitUShareSettings
{
    [UMConfigure deviceIDForIntegration];
    [[UMSocialManager defaultManager] openLog:NO];
    [UMConfigure initWithAppkey:UM_KEY channel:@"App Store"];
    [UMSocialGlobal shareInstance].universalLinkDic = @{@(UMSocialPlatformType_WechatSession):UNIVERSALLINK,@(UMSocialPlatformType_WechatTimeLine):UNIVERSALLINK};
    https://api.urmoli.com/apple-app-site-association
    [UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
}

- (void)configUSharePlatforms
{
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:UM_WX_KEY appSecret:UM_WX_SER redirectURL:@"http://mobile.umeng.com/social"];
   
    
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:UM_QQ_KEY/*设置QQ平台的appID*/  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
    
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:UM_WB_KEY  appSecret:UM_WB_SER redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
    
    /* 设置Facebook的appKey和UrlString */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Facebook appKey:UM_FB_KEY  appSecret:nil redirectURL:@"http://www.umeng.com/social"];
   
}

#pragma mark- OpenInstall 注册
- (void)registOpenInstallSDK:(NSDictionary *)launchOptions
{
    [OpenInstallSDK initWithDelegate:self];
}

#pragma 一键拉起的参数回调方法
-(void)getWakeUpParams:(OpeninstallData *)appData{
    
    if (appData.data) {//(动态唤醒参数)
        //e.g.如免填邀请码建立邀请关系、自动加好友、自动进入某个群组或房间等
        NSDictionary *ext =[STSystemHelper lxlcustomDataToDic:appData.data[@"extras"]];
        
//        [self jumpEvent:ext];
//        return;
        //0 纯文本  1h5 2个人中心 3剧本详情 4专辑列表 5剧场大厅 6剧本列表 8房间
        
        MOLSystemModel *model =[MOLSystemModel new];
        SystemSubModel *subModel =[SystemSubModel new];
        subModel.jumpType =[ext[@"jumpType"] integerValue];
        
        if ([ext[@"jumpType"] integerValue] == 8) {//房间
        
            RoomModel *room =[RoomModel new];
            room.websocket =ext[@"url"];
            room.uuid =[ext[@"jumpTitle"] integerValue];
            room.roomId = [NSString stringWithFormat:@"%ld",[ext[@"jumpId"] integerValue]];//ext[@"jumpId"] integerValue];
            room.roomKind = [ext[@"roomKind"] integerValue];
            model.jumpInfo =room;
            
            for (id vc in [[[GlobalManager shareGlobalManager] global_currentNavigationViewControl] viewControllers]) {
                
                if ([vc isKindOfClass:[ChatRoomViewController class]]) {
                    return;
                }
                
            }
            
            
        }else{
            
            subModel.jumpId = [ext[@"jumpId"] integerValue];
            subModel.jumpTitle =ext[@"jumpTitle"];
           
            
        }
         model.info =subModel;
        
        if ([UserManagerInstance user_isLogin]) {
            [[JumpToObject sharedManager] jumpToObjectEvent:model type:101];
        }

        
    }
    if (appData.channelCode) {//(通过渠道链接或二维码安装会返回渠道编号)
        //e.g.可自己统计渠道相关数据等
    }
    
}


#pragma mark-
#pragma mark 网易云信 IM 即时通讯
- (void)app_registNIMSDK
{
    [[NIMSDKConfig sharedConfig] setShouldSyncUnreadCount:YES];
    [[NIMSDKConfig sharedConfig] setMaxAutoLoginRetryTimes:10];
    
    NIMServerSetting *setting    = [[NIMServerSetting alloc] init];
    setting.httpsEnabled = NO;
    [[NIMSDK sharedSDK] setServerSetting:setting];
    
    //推荐在程序启动的时候初始化 NIMSDK
    NSString *appKey        = @"030f484739302b639145adfab7a388da";
    NSString * apnsCername =@"iOSAPNsAcDis";
    
    #ifdef DEBUG
        appKey        = @"054970e40d416d1f38f97263349b6e99";
        apnsCername =@"iOSAPNsACTEST";
    #endif
    
   NIMSDKOption *option    = [NIMSDKOption optionWithAppKey:appKey];
   option.apnsCername      = apnsCername;
 //  option.pkCername        = apnsCername;
   [[NIMSDK sharedSDK] registerWithOption:option];
    
   [JAChatMessageManager yx_autoLoginYX];
    
   [[NIMSDK sharedSDK].loginManager addDelegate:self];
    
    // 透传消息
//    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
//    [defaultCenter addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
    
    //注册自定义消息的解析器
    [NIMCustomObject registerCustomDecoder:[NTESCustomAttachmentDecoder new]];
    //注册 NIMKit 自定义排版配置
    [[NIMKit sharedKit] registerLayoutConfig:[NTESCellLayoutConfig new]];
    
}

#pragma mark - misc
- (void)registerPushService
{
    if (@available(iOS 11.0, *))
    {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (!granted)
            {
                dispatch_async_main_safe(^{
                    //[[UIApplication sharedApplication].keyWindow makeToast:@"请开启推送功能否则无法收到推送通知" duration:2.0 position:CSToastPositionCenter];
                })
            }
        }];
    }
    else
    {
        UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types
                                                                                 categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
    
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    
    //pushkit
//    PKPushRegistry *pushRegistry = [[PKPushRegistry alloc] initWithQueue:dispatch_get_main_queue()];
//    pushRegistry.delegate = self;
//    pushRegistry.desiredPushTypes = [NSSet setWithObject:PKPushTypeVoIP];

    
    // 注册push权限，用于显示本地推送
    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
    
    
    //腾讯push 配置
    
    int accessId;
    NSString *key;
#ifdef DEBUG
    accessId = 1600034264;
    key = @"IHXG461BWH75";
       #else
    accessId = 1600034248;
    key = @"I66Y7ZDJVYWY";
       #endif
    
    
    [[XGPush defaultManager] setEnableDebug:YES];
    [[XGPush defaultManager] startXGWithAccessID:accessId accessKey:key delegate:self];
}

#pragma mark - XGPushDelegate
- (void)xgPushDidReceiveRemoteNotification:(nonnull id)notification withCompletionHandler:(nullable void (^)(NSUInteger))completionHandler{
    //NSLog(@"apple");
}
 /// 统一点击回调
/// @param response 如果iOS 10+/macOS 10.14+则为UNNotificationResponse，低于目标版本则为NSDictionary
- (void)xgPushDidReceiveNotificationResponse:(nonnull id)response withCompletionHandler:(nonnull void (^)(void))completionHandler {
    
    if ([response isKindOfClass:[UNNotificationResponse class]]) {
        /// iOS10+消息体获取
        NSDictionary *dict = ((UNNotificationResponse *)response).notification.request.content.userInfo;
        if (dict[@"custom"]){
            NSData *data = [dict[@"custom"] dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *custom = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            JumpInfo *info = [JumpInfo mj_objectWithKeyValues:custom[@"jumper"]];
            [[RouterPageManager sharedManager] jumpToObjectEvent:info extend:0];
        }
    } else if ([response isKindOfClass:[NSDictionary class]]) {
        /// <IOS10消息体获取
       // NSLog(@"notification dic: %@", response);
    }
}

/**
@brief 注册推送服务回调
@param deviceToken APNs 生成的 Device Token
@param xgToken TPNS 生成的 Token，推送消息时需要使用此值。TPNS 维护此值与 APNs 的 Device Token 的映射关系
@param error 错误信息，若 error 为 nil 则注册推送服务成功
@note TPNS SDK1.2.6.0+
*/
- (void)xgPushDidRegisteredDeviceToken:(nullable NSString *)deviceToken xgToken:(nullable NSString *)xgToken error:(nullable NSError *)error{
   // NSLog(@"%@",xgToken);
    
    /// 已登录
    if ([UserManagerInstance user_isLogin]) {
        UserModel *user = [UserManagerInstance user_getUserInfo];
        
        [[XGPushTokenManager defaultTokenManager] upsertAccountsByDict:@{
            @(0):user.userId.length ? user.userId : @""
        }];
    }
    
}

/// 注册推送服务失败回调
/// @param error 注册失败错误信息
/// @note TPNS SDK1.2.7.1+
- (void)xgPushDidFailToRegisterDeviceTokenWithError:(nullable NSError *)error {
    
    
    
}


#pragma mark - NIMLoginManagerDelegate
// 自动登录的回调
- (void)onLogin:(NIMLoginStep)step
{
    switch (step) {
        case NIMLoginStepLinkOK:
         //   DSLog(@"云信连接服务器成功");
            break;
        case NIMLoginStepLinkFailed:
         //   DSLog(@"云信连接服务器失败");
            break;
        case NIMLoginStepLoginOK:
         //   DSLog(@"云信自动登录成功");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"yx_loginSuccess" object:nil];
            break;
        case NIMLoginStepLoginFailed:
          //  DSLog(@"云信自动登录失败");
            
        default:
            break;
    }
    
}

#pragma NIMLoginManagerDelegate
-(void)onKick:(NIMKickReason)code clientType:(NIMLoginClientType)clientType
{
    NSString *reason = @"该账号在别处登录";
    switch (code) {
        case NIMKickReasonByClient:
        case NIMKickReasonByClientManually:{
          //  [OMGToast showWithText:[NSString stringWithFormat:@"%@",reason]];
          //  NSString *clientName = [NTESClientUtil clientName:clientType];
         //   reason = clientName.length ? [NSString stringWithFormat:@"你的帐号被%@端踢出下线，请注意帐号信息安全",clientName] : @"你的帐号被踢出下线，请注意帐号信息安全";
            break;
        }
        case NIMKickReasonByServer:
         //  [OMGToast showWithText:[NSString stringWithFormat:@"%@",reason]];
            break;
        default:
            break;
    }
    
        [OMGToast showWithText:[NSString stringWithFormat:@"%@",reason]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [[GlobalManager shareGlobalManager] global_modelLogout];
        
    });
        
    
}




#pragma mark - 极光
/// 注册极光
- (void)app_registJpush:(NSDictionary *)launchOptions
{
    return;
    
    // 初始化APNS
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];

   
    // 初始化极光push
    NSString *jpushKey = JPUSH_KEY_DEBUG;
    
    // 获取bundleId
    
    BOOL isP = YES; //生产证书
#ifdef DEBUG
    isP =NO; //开发证书
#else
    isP = YES; //生产证书
      jpushKey =JPUSH_KEY_RELEASE;
#endif
    
    
    [JPUSHService setupWithOption:launchOptions appKey:jpushKey
                          channel:APPStore
                 apsForProduction:isP
            advertisingIdentifier:nil];
    
    [JPUSHService setLogOFF];
    ///////////////
    
    
    
    NSDictionary *remoteNotification = [launchOptions objectForKey: UIApplicationLaunchOptionsRemoteNotificationKey];
    
    if (remoteNotification) {
        
        [BMSHelper bmsLog:[NSString stringWithFormat:@"RemoteNotification:%@", [remoteNotification mj_JSONObject]]];
        
        [self imStatusEvent:remoteNotification];
        
        /////////////
        NSDictionary *ext = remoteNotification[@"extras"];
        
        NSString *type  = ext[@"msgType"];
        
    
        //////////
        
        NSDictionary *info =ext[@"info"];
        
        if (info) {
            
            NSString *jumpType = info[@"jumpType"];
           // NSString *url = info[@"url"];
            
            if (type.integerValue ==3 || type.integerValue ==4) {
                
                if (jumpType.integerValue ==1) {//跳转1h5
                    [self jump:remoteNotification];
                }
                
            }
            
        }
        //////////
        
        
        ////////////

    }

    // 极光透传消息
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
   
}

- (void)jump:(NSDictionary *)notiDic
{
   
    if (notiDic) {
        NSDictionary *dic = notiDic;
       
       
        NSString *type  = dic[@"msgType"];
        
        //////////
        
        NSDictionary *info =[STSystemHelper lxlcustomDataToDic:dic[@"info"]];
        
        if (info) {
            
            NSString *jumpType = info[@"jumpType"];
            NSString *url = info[@"url"];
            //msgType//1系统，2好友 3任务通知 4.成就通知 5.好友列表(私信) 6.话题通知
            if (type.integerValue ==3 || type.integerValue ==4) {
                
                if (jumpType.integerValue ==1) {//跳转1h5
                    MOLWebViewController *web =[MOLWebViewController new];
                    web.urlString =url.length?url:@"";
                    
                    [[[GlobalManager shareGlobalManager] global_currentNavigationViewControl] pushViewController:web animated:YES];
                    
                    if (type.integerValue ==3) {//任务
                        [Defaults setInteger:0 forKey: MSG_TASK_TYPE];
                        [Defaults synchronize];
                        
                    }else if (type.integerValue ==4){//成就
                        [Defaults setInteger:0 forKey: MSG_ACHIEVEMENT_TYPE];
                        [Defaults synchronize];
                    }
                }
                
            }
            
        }
        //////////
    
    }
        
}



- (void)imStatusEvent:(NSDictionary *)dic{
    
    if (dic[@"_j_msgid"]) {
        NSDictionary *ext = dic[@"extras"];
        
        NSString *type  = ext[@"msgType"];

        //
        if (type.integerValue ==1 ||
            type.intValue ==6 ||
            type.intValue ==7 ||
            type.intValue ==8) {
            [Defaults setInteger:1 forKey:MSG_IM_TYPE];
            [Defaults synchronize];
  //          [self.tabC.tabBar showBadgeOnItemIndex:3];

            switch (type.intValue) {
                case 1://通知
                {
                    [Defaults setInteger:1 forKey: MSG_TONGZHI_TYPE];
                    [Defaults synchronize];
                }
                    break;
                case 6://话题
                {
                    [Defaults setInteger:1 forKey: MSG_HUATI_TYPE];
                    [Defaults synchronize];
                }
                    break;
                case 7://动态
                {
                    [Defaults setInteger:1 forKey: MSG_DONGTAI_TYPE];
                    [Defaults synchronize];
                }
                    break;
                case 8://大陆
                {
                    [Defaults setInteger:1 forKey: MSG_XIAOZU_TYPE];
                    [Defaults synchronize];
                    
                    NSInteger num =[Defaults integerForKey:MSG_XIAOZU_IMNUMBER];
                    
                    if (num <=0) {
                        num =0;
                    }
                    
                    num ++;
                    
                    [Defaults setInteger:num forKey: MSG_XIAOZU_IMNUMBER];
                    [Defaults synchronize];
                }
                    break;
                    
            }
            
            
        }else if (type.integerValue ==3) {//任务
            [Defaults setInteger:1 forKey: MSG_TASK_TYPE];
            [Defaults synchronize];
            
        }else if (type.integerValue ==4){//成就
            [Defaults setInteger:1 forKey: MSG_ACHIEVEMENT_TYPE];
            [Defaults synchronize];
        }
        
    }
    
    
    
    // if (![Defaults integerForKey:ISDEBUG]) {
    
    // }
    
//    if ([UserManagerInstance user_isLogin]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:IM_NOTIF object:dic];
//    }
    

    
    
}

// 极光透传
- (void)networkDidReceiveMessage:(NSNotification *)notification {
    
    if ([UserManagerInstance user_isLogin]) {
        NSInteger redNum =1;
        redNum +=[Defaults integerForKey:BADGENUMBER];
        [Defaults setInteger:redNum forKey:BADGENUMBER];
        
        [Defaults setBool:YES forKey:IM_NOTIF];
    }
    
    
    
    // 解析服务器数据
    NSDictionary *dic = notification.userInfo;
    
    [self imStatusEvent:dic];
    
   
    // type    : chat /
//    if (dic[@"_j_msgid"]) {
//        NSDictionary *ext = dic[@"extras"];
//        NSInteger type = [ext[@"msgType"] integerValue];
//        NSString *subtype = ext[@"type"];
//        NSString *chatId = ext[@"typeId"];
    
//            sendTime
//
//        if (type == 4 || type == 5 || type == 6) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"ALETTER_PUSH_MESSAGE" object:ext];
//        }
//        if (type != 5 && type != 6) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"ALETTER_PUSH" object:nil];
//        }
//    }
    
}


- (void)jumpEvent:(NSDictionary *)userInfo{
    
    if (userInfo) {
        
        
        if ([userInfo[@"jumpType"] integerValue] == 16 ||
            [userInfo[@"jumpType"] integerValue] == 17 ||
            [userInfo[@"jumpType"] integerValue] == 18 ) {
            
            MOLSystemModel *model =[MOLSystemModel new];
            
            SystemSubModel *subModle =[SystemSubModel new];
            subModle.jumpType =[userInfo[@"jumpType"] integerValue];
            model.info =subModle;
            
            [[JumpToObject sharedManager] jumpToObjectEvent:model type:0];
            return;
        
        }else if ([userInfo.allKeys containsObject:@"jumpInfo"]) {
            
            NSDictionary *infoDic = [STSystemHelper lxlcustomDataToDic:userInfo[@"jumpInfo"]];
            
            NSInteger jumpType =[infoDic[@"jumpType"] integerValue];
            
            
            if (jumpType == 19) {//大陆站内邀请
                MOLSystemModel *model =[MOLSystemModel new];
                           
               SystemSubModel *subModle =[SystemSubModel new];
               subModle.jumpType =[infoDic[@"jumpType"] integerValue];
               subModle.jumpId =[infoDic[@"teamId"] integerValue];
               model.info =subModle;
               
               [[JumpToObject sharedManager] jumpToObjectEvent:model type:0];
                return;
                
            }else if (jumpType == 8) {//房间
                NSInteger roomID =[infoDic[@"jumpId"] integerValue];
                
                MOLSystemModel *systemModel =[MOLSystemModel new];
                SystemSubModel *info =[SystemSubModel new];
                info.jumpType =jumpType;
                
                systemModel.info =info;
                
                RoomModel *room =[RoomModel new];
                room.roomId =[NSString stringWithFormat:@"%ld",roomID];
                systemModel.jumpInfo=room;
                
                [[JumpToObject sharedManager] jumpToObjectEvent:systemModel type:0];
                return;
                
            }
            
        }else if ([userInfo.allKeys containsObject:@"info"]){
            NSDictionary *dic = [STSystemHelper lxlcustomDataToDic:userInfo[@"info"]];
            
            NSInteger pageType =0;
            NSString *typeId =nil;
            NSString *pageUrl =nil;
            NSString *typeTitle =nil;
            NSString *commentId =nil;
            NSString *replyId =nil;
            PostMsgModel *postMsg =nil;
            
            pageType = [dic[@"jumpType"] integerValue];
            
            
            if ([dic.allKeys containsObject:@"jumpId"]) {
                typeId = [NSString stringWithFormat:@"%ld",[dic[@"jumpId"] integerValue]];
            }
            
            if ([dic.allKeys containsObject: @"url"]) {
                pageUrl =dic[@"url"];
            }
            
            if ([dic.allKeys containsObject: @"postMsg"]) {
                postMsg = [PostMsgModel mj_objectWithKeyValues:dic[@"postMsg"]];

            }
            
             MOLSystemModel *model =[MOLSystemModel new];
            
            switch (pageType) {
                case 1://h5
                {
                   // pageUrl =dic[@"url"];
                }
                    break;
                case 6://底部跳转
                    break;
                case 8://房间跳转
                {
                    RoomModel *room =[RoomModel new];
                    room.roomId =[NSString stringWithFormat:@"%ld",typeId.integerValue];
                    model.jumpInfo=room;
                }
                    break;
                case 12: //话题点赞跳转
                {
                 //   typeId = [NSString stringWithFormat:@"%ld",[dic[@"jumpId"] integerValue]];
                }
                    break;
                case 13:
                case 14:
                {
                    typeId = [NSString stringWithFormat:@"%ld",[dic[@"postMsg"][@"postId"] integerValue]];
                    commentId =[NSString stringWithFormat:@"%ld",[dic[@"postMsg"][@"commentId"] integerValue]];
                    replyId =[NSString stringWithFormat:@"%ld",[dic[@"postMsg"][@"replyId"] integerValue]];
                }
                    break;
                case 20:
               {
                   typeId = [NSString stringWithFormat:@"%ld",[dic[@"postMsg"][@"postId"] integerValue]];
                   
               }
                   break;
                case 21:
                {
                    typeId = [NSString stringWithFormat:@"%ld",[dic[@"postMsg"][@"postId"] integerValue]];
                    commentId =[NSString stringWithFormat:@"%ld",[dic[@"postMsg"][@"commentId"] integerValue]];
                    replyId =[NSString stringWithFormat:@"%ld",[dic[@"postMsg"][@"replyId"] integerValue]];
                }
                    break;
               
            }
          
            
        
           SystemSubModel *subModle =[SystemSubModel new];
           subModle.jumpType =pageType;
           subModle.jumpId =typeId.integerValue;
           subModle.url =pageUrl.length?pageUrl:@"";
           subModle.jumpTitle =typeTitle.length?typeTitle:@"";
           subModle.commentId =commentId.length?commentId:@"";
           subModle.replyId =replyId.length?replyId:@"";
            if (postMsg) {
                subModle.postMsg =postMsg;
            }
            
           model.info =subModle;
          
           
           [[JumpToObject sharedManager] jumpToObjectEvent:model type:0];
            return;
        
        }
        
        
        NSInteger jumpType =0;
        NSInteger jumpId =0;
        if ([userInfo.allKeys containsObject:@"jumpType"]) {
            jumpType = [userInfo[@"jumpType"] integerValue];
        }
        
        if ([userInfo.allKeys containsObject:@"jumpId"]) {
            jumpId = [userInfo[@"jumpId"] integerValue];
        }
        
        if ([userInfo.allKeys containsObject:@"teamQuestionId"]) {
            jumpId = [userInfo[@"teamQuestionId"] integerValue];
        }
        
        MOLSystemModel *model =[MOLSystemModel new];
        SystemSubModel *subModle =[SystemSubModel new];
        subModle.jumpType =jumpType;
        subModle.jumpId =jumpId;
    
        model.info =subModle;
        
        [[JumpToObject sharedManager] jumpToObjectEvent:model type:0];
        
        
    }
    
    
#if 0
    
    //msgType//1系统，2好友 3任务通知 4.成就通知 5.好友列表(私信) 6.话题通知
    if (userInfo) {
        
        NSString *type  = userInfo[@"jumpType"];
        
     //   [OMGToast showWithText: [NSString stringWithFormat:@"%@",userInfo]];
        
        if (type.integerValue == 1 ||
            /*type.integerValue ==2  ||*/
            type.integerValue ==5  ||
            type.integerValue ==6) {
            
            MOLSystemModel *messageModel =[MOLSystemModel mj_objectWithKeyValues:userInfo[@"chatLogVO"]];
            
            if (!messageModel) {
                messageModel =[MOLSystemModel new];
            }
            
            messageModel.msgType =type.integerValue;
            messageModel.robotSign =[userInfo[@"robotSign"] integerValue];
            
            if (type.integerValue == 5) {
                
                if (![userInfo[@"chatId"] integerValue]) {
                    return;
                }
                
            }
            
            BSTabBarController *tabBarV=(BSTabBarController *)[[GlobalManager shareGlobalManager] global_rootViewControl];
            
            
            if (tabBarV) {
                
                if (tabBarV.tabBar) {
                    [tabBarV.tabBar hideBadgeOnItemIndex:3];
                }
                
            }
            
           
            [[JumpToObject sharedManager] jumpToImEvent:messageModel type:0];
            
            return;
            
        }else if (type.integerValue ==8){
//            MOLSystemModel *messageModel =[MOLSystemModel new];
//            SystemSubModel *info =[SystemSubModel new];
//            info.jumpType =type.integerValue;
//            
//            RoomModel *room =RoomModel.new;
//            room.roomId =userInfo
//            
//            messageModel.info =info;
            
        }
        
        //////////
        
        NSDictionary *info =[STSystemHelper lxlcustomDataToDic: userInfo[@"info"]];
        
        if (info) {
            
            NSString *jumpType = info[@"jumpType"];
            NSString *url = info[@"url"];
            
            if (type.integerValue ==3 || type.integerValue ==4) {
                
                if (jumpType.integerValue ==1) {//跳转1h5
                    [self jump:userInfo];
                }
                
            }
            
        }
        //////////
        
    }
#endif
    
    
}

#pragma mark- JPUSHRegisterDelegate



// iOS 12 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{
    if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //从通知界面直接进入应用
        
        NSDictionary * userInfo = notification.request.content.userInfo;
        
        
     //     [self imStatusEvent:userInfo];
        
     //   if ([userInfo.allKeys containsObject:@"nim"]) {//表示云信SDK
            [self jumpEvent:userInfo];
     //   }
        
        
    }else{
        //从通知设置界面进入应用
    }

    
}


// 通知的点击事件
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler API_AVAILABLE(ios(10.0)){
    
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    //    UNNotificationRequest *request = response.notification.request; // 收到推送的请求
    //    UNNotificationContent *content = request.content; // 收到推送的消息内容
    //    NSNumber *badge = content.badge;  // 推送消息的角标
    //    NSString *body = content.body;    // 推送消息体
    //    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    //    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    //    NSString *title = content.title;  // 推送消息的标题
    
    
    
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //NSLog(@"iOS10 收到远程通知:%@", [self logDic:userInfo]);
       // if ([userInfo.allKeys containsObject:@"nim"]) {//表示云信SDK
            [self jumpEvent:userInfo];
       // }
        
    }
    else {
        // 判断为本地通知
        // NSLog(@"iOS10 收到本地通知:{\\\\nbody:%@，\\\\ntitle:%@,\\\\nsubtitle:%@,\\\\nbadge：%@，\\\\nsound：%@，\\\\nuserInfo：%@\\\\n}",body,title,subtitle,badge,sound,userInfo);
    }
    
    // Warning: UNUserNotificationCenter delegate received call to -userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler: but the completion handler was never called.
    //    completionHandler();  // 系统要求执行这个方法
    
}



// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
  //  NSDictionary * userInfo = notification.request.content.userInfo;
  //  [self imStatusEvent:userInfo];
    
  //  [self jumpEvent:userInfo];
    
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
         //[[NSNotificationCenter defaultCenter] postNotificationName:IM_NOTIF object:userInfo];
        //[JPUSHService handleRemoteNotification:userInfo];
      //  [self jumpEvent:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    [self imStatusEvent:userInfo];
    
    /////////////
    
  //  [self jumpEvent:userInfo];
    
    
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //[[NSNotificationCenter defaultCenter] postNotificationName:IM_NOTIF object:userInfo];
        //[JPUSHService handleRemoteNotification:userInfo];
        
       // if ([userInfo.allKeys containsObject:@"nim"]) {//表示云信SDK
            [self jumpEvent:userInfo];
       // }
        
    }
    completionHandler();  // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support
   // [self imStatusEvent:userInfo];
    
   // [self jumpEvent:userInfo];
    
   // [[NSNotificationCenter defaultCenter] postNotificationName:IM_NOTIF object:userInfo];
   // [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required, For systems with less than or equal to iOS 6
    //[[NSNotificationCenter defaultCenter] postNotificationName:IM_NOTIF object:userInfo];
   // [JPUSHService handleRemoteNotification:userInfo];
    
    
  //  [self imStatusEvent:userInfo];
    
    
  //  [self jumpEvent:userInfo];
    
}



// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
     //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        
        //判断是否通过OpenInstall URL Scheme 唤起App
        if (![OpenInstallSDK handLinkURL:url]) {
            
            // 其他如支付等SDK的回调
            return [WXApi handleOpenURL:url delegate:self];
        }
        
       
    }
    return result;
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
    if (!result) {
        
        //判断是否通过OpenInstall URL Scheme 唤起App
           if (![OpenInstallSDK handLinkURL:url]) {
               // 其他如支付等SDK的回调
                return [WXApi handleOpenURL:url delegate:self];
               
           }
    }
    return result;
}

//Universal Links 通用链接
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler
{
    
    //判断是否通过OpenInstall Universal Links 唤起App
    // [UMSocialGlobal shareInstance].universalLinkDic = @{@(UMSocialPlatformType_WechatSession):@"https://www.urmoli.com/"};
    
    if (![[UMSocialManager defaultManager] handleUniversalLink:userActivity options:nil]) {
           
            if ([OpenInstallSDK continueUserActivity:userActivity]) {
               return [WXApi handleOpenUniversalLink:userActivity delegate:self];
            }
       }
    
    //其他代码
    return YES;
    
}


/// 书架初始化--app首次启动时候客户端调用加入推荐书
- (void)configInitShelfApi{
    [[[BookcaseApi alloc] initShelf:@{}] baseNetwork_startRequestWithcompletion:^(__kindof BSNetRequest * _Nonnull request, BSModel * _Nonnull responseModel, NSInteger code, NSString * _Nonnull message) {
    
        if (code == SUCCESS_REQUEST) {
            
        }else{
           
        }
        
    } failure:^(__kindof BSNetRequest * _Nonnull request) {
        
    }];
}


#pragma mark-
#pragma mark 有道评测
- (void)yd_TranslateInstance_AppKey
{
//    //初始化key
//    YDTranslateInstance *yd = [YDTranslateInstance sharedInstance];
//    yd.appKey = @"27088bc6557c2d4b";
}



@end
