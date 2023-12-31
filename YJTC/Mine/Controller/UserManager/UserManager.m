//
//  UserManager.m
//  AC
//
//  Created by xujin on 2018/11/19.
//  Copyright © 2018年 Moli. All rights reserved.
//

#import "UserManager.h"
#import "UserModel.h"

@implementation UserManager

+ (instancetype)shareInstance
{
    static UserManager* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil)
        {
            instance = [[UserManager alloc] init];
            
            
        }
    });
    return instance;
}

- (BOOL)user_isLogin
{
    BOOL status = [[NSUserDefaults standardUserDefaults] boolForKey:@"user_loginStatus"];
    UserModel *user = [self user_getUserInfo];
    return status && user.userId.length;
   
}

///  登录时更新用户信息
- (void)user_loginSaveUserInfoWithModel:(UserModel *)user isLogin:(BOOL)login
{
    [self user_saveUserInfoWithModel:user isLogin:login];
    
    if (login) {
        
       
    }
}

/// 保存用户信息
- (void)user_saveUserInfoWithModel:(UserModel *)user isLogin:(BOOL)login
{
    UserModel *oldUser = [self user_getUserInfo];
    
#if 0
    if (!user.token.length && oldUser.userId.length && oldUser.token.length) {
        user.token = oldUser.token;
    }
    if (login) {
        [Defaults setBool:login forKey:@"user_loginStatus"];
        [Defaults synchronize];
    }
    
    NSString *filename = [NSString mol_creatNSDocumentFileWithFileName:@"mol_userInfo"]; // 用户异常退出的bug
    BOOL status = [NSKeyedArchiver archiveRootObject:user toFile:filename];
    
    
    if (status) {
        if (login) {
           // [[NSNotificationCenter defaultCenter] postNotificationName:SUCCESS_USER_LOGIN object:nil];
        }
    }
    
#endif
    
}

/// 获取用户信息
- (UserModel *)user_getUserInfo
{
    NSString *filename = [NSString mol_creatNSDocumentFileWithFileName:@"mol_userInfo"]; // 用户异常退出的bug
    // 读取本地缓存数据
    UserModel *user = [NSKeyedUnarchiver unarchiveObjectWithFile:filename];
    if (user) {
        return user;
    }else{
        return nil;
    }
}

/// 获取用户id
- (NSString *)user_getUserId
{
    UserModel *user = [self user_getUserInfo];
    return user.userId;
}

/// 清除用户信息
- (void)user_clearUserInfo
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user_loginStatus"];
    
    NSString *filename = [NSString mol_creatNSDocumentFileWithFileName:@"mol_userInfo"];  
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    BOOL bRet = [fileMgr fileExistsAtPath:filename];
    if (bRet) {
        NSError *err;
        [fileMgr removeItemAtPath:filename error:&err];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:SUCCESS_USER_LOGINOUT object:nil];
    

    
}


- (void)loginSuccess:(UserModel *)user {

    [self loginSuccessData:user];
    [self loginSuccessEvent];
    
                       

}

- (void)loginSuccessEvent{
    
#if 0

    OC_WeakSelf
    [[[MOLAppStartRequest alloc] initUserTxImUserSigWithParameter:@{}] baseNetwork_startRequestWithcompletion:^(__kindof BSNetRequest *request, BSModel *responseModel, NSInteger code, NSString *message) {
        
        if (code == SUCCESS_REQUEST) {
            ///////////
            NSDictionary *dic = request.responseObject[@"resBody"];
            [CampoManager sharedManager].sdkAppID = [dic[@"appId"] intValue];
            [CampoManager sharedManager].userSig = dic[@"userSig"];
            
            [JAChatMessageManager login:UserManagerInstance.user_getUserId userSig:@"" succ:^{
                
            } fail:^(int code, NSString * _Nonnull msg) {
                
            }];
            
//            V2TIMSDKConfig *config = [[V2TIMSDKConfig alloc] init];
//            config.logLevel = V2TIM_LOG_INFO;
//            [[V2TIMManager sharedInstance] initSDK:[CampoManager sharedManager].sdkAppID config:config listener:nil];
        }
        
        [weakSelf initDelegate];
        
    } failure:^(__kindof BSNetRequest *request) {
        [weakSelf initDelegate];
        
        
    }];
    
#endif
            
}

- (void)initDelegate {
#if 0
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate initSystem];
#endif
}

- (void)loginSuccessData:(UserModel *)user{
    
    // 登录成功
    [UserManagerInstance user_loginSaveUserInfoWithModel:user isLogin:YES];
   
    [[NSNotificationCenter defaultCenter] postNotificationName:SUCCESS_USER_LOGIN object:nil];

}






@end
