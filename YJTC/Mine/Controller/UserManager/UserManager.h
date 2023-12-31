//
//  UserManager.h
//  AC
//
//  Created by xujin on 2018/11/19.
//  Copyright © 2018年 Moli. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define UserManagerInstance [UserManager shareInstance]

@class UserModel;
@interface UserManager : NSObject

+ (instancetype)shareInstance;


/// 获取用户是否登录
- (BOOL)user_isLogin;


/// 保存用户信息
- (void)user_saveUserInfoWithModel:(UserModel *)user isLogin:(BOOL)login;

///  登录时更新用户信息
- (void)user_loginSaveUserInfoWithModel:(UserModel *)user isLogin:(BOOL)login;

/// 获取用户信息
- (UserModel *)user_getUserInfo;

/// 清除用户信息
- (void)user_clearUserInfo;

/// 获取用户id
- (NSString *)user_getUserId;

/// 登录成功调用事件
- (void)loginSuccess:(UserModel *)user;
- (void)loginSuccessEvent;
- (void)loginSuccessData:(UserModel *)user;
@end

NS_ASSUME_NONNULL_END
