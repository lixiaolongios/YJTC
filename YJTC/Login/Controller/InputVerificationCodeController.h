//
//  InputVerificationCodeController.h
//  AC
//
//  Created by xujin on 2020/1/10.
//  Copyright © 2020 Moli. All rights reserved.
//

#import "BSViewController.h"
#import "SPBaseLoginVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface InputVerificationCodeController : SPBaseLoginVC
@property (nonatomic, copy)NSString *areacodeStr;
@property (nonatomic, copy)NSString *phoneNumStr;
@property (nonatomic, assign)NSInteger fromVC; //1000 来自登录页面 1001来自忘记密码 1002来自更换手机号 1003 来自注销账号
@end

NS_ASSUME_NONNULL_END
