//
//  VerificationCode.m
//  AC
//
//  Created by 徐天牧 on 2022/10/16.
//  Copyright © 2022 Moli. All rights reserved.
//

#import "VerificationCode.h"
#import "CRBoxInputView.h"
//#import "SettingViewController.h"
//#import "LoginManager.h"
//#import "LLWebView.h"

@interface VerificationCode ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (nonatomic, copy)NSString *areacodeStr;
@property (nonatomic, copy)NSString *phoneNumStr;
@property (nonatomic, copy)NSString *codeStr;
@property (nonatomic, assign) NSInteger timeCount; //获取验证码间隔秒数，目前定于59秒
@property (nonatomic, strong) NSTimer *timer; //获取验证码定时器
@property (weak, nonatomic) IBOutlet UIButton *getVCBtn;

@property (weak, nonatomic) IBOutlet UIView *boxBg;
@property (nonatomic,strong)CRBoxInputView *boxInputView;

@property (nonatomic, assign)NSInteger fromVC; //1000 来自登录页面 1001来自忘记密码 1002来自更换手机号 1003 来自注销账号


@end

@implementation VerificationCode
+ (VerificationCode *)showVerificationCode:(NSString *)areacodeStr phoneNumStr:(NSString *)phoneNumStr fromVC:(NSInteger)fromVC {
    VerificationCode *view = [VerificationCode loadFromXib];
    view.areacodeStr = areacodeStr;
    view.phoneNumStr = phoneNumStr;
    view.fromVC = fromVC;
    view.frame = CGRectMake(0,StatusBarHeight, KSCREEN_WIDTH, KSCREEN_HEIGHT - StatusBarHeight - KTabbarHeight);
    [view layoutUI];
    return view;
}

- (void)layoutUI {
    
    [self.getVCBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    [self.boxBg addSubview: self.boxInputView];
    
    [self getVerificationCode];

}

- (CRBoxInputView *)boxInputView {
    if (!_boxInputView) {
        _boxInputView = [[CRBoxInputView alloc] initWithFrame:CGRectMake(0, 0, self.boxBg.width, self.boxBg.height)];
        _boxInputView.type = 1000;
        _boxInputView.codeLength = 4;// 不设置时，默认4
        _boxInputView.keyBoardType = UIKeyboardTypeNumberPad;// 不设置时，默认UIKeyboardTypeNumberPad
       // [_boxInputView setIfNeedCursor:YES];
        [_boxInputView loadAndPrepareViewWithBeginEdit:NO]; // BeginEdit:是否自动启用编辑模式
    
        // 获取值
        // 方法1, 当输入文字变化时触发回调block
        OC_WeakSelf
        _boxInputView.textDidChangeblock = ^(NSString *text, BOOL isFinished) {
            weakSelf.codeStr = text;
            [weakSelf loginButtonChangeEvent];
        };
    }
    
    return _boxInputView;
}
#pragma mark-
#pragma mark action event
- (void)loginButtonChangeEvent{
    if ([self.areacodeStr isEqualToString:@"86"] && self.phoneNumStr.length == 11 && self.codeStr.length == 4) {
        [self loginButtonChange:YES];
        
    } else if (self.phoneNumStr.length && ![self.areacodeStr isEqualToString:@"86"] && self.codeStr.length == 4){
        [self loginButtonChange:YES];
        
    }else{
        [self loginButtonChange:NO];
    }
}
- (void)loginButtonChange:(BOOL)isChange {
    [self.loginButton setSelected:isChange];
    [self.loginButton setEnabled:isChange];
    
    [self.loginButton setBackgroundColor:HEX_COLOR_ALPHA(0x24D8DD,isChange ? 1.0 : 0.3)];
}

#pragma mark-
#pragma mark action event 网络请求 校验手机号与验证码是否匹配
- (IBAction)mobileVerifyEvent:(UIButton *)sender {
    //canEdit =NO;
    
    if (!self.areacodeStr.length) {
        
        [OMGToast showWithText:@"区号不能为空" topOffset:64];
        return;
    }
    
    if (!self.phoneNumStr.length) {
       [OMGToast showWithText:@"手机号不能为空" topOffset:64];
        return;
    }
    
    if (!self.codeStr.length) {
        [OMGToast showWithText:@"验证码不能为空" topOffset:64];
        return;
    }
    
  
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[@"phone"] =self.phoneNumStr;
    dic[@"areaCode"] = self.areacodeStr;
    dic[@"phoneCode"] = self.codeStr;
    
    id api;
    
   
        dic[@"loginType"] = @"5";//验证码登录
       // UserManagerInstance.platType = 5;
      //  [LoginManager registerWithParameter:dic];
    
    @weakify(self)
   
      
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self)
        BSTabBarController *tab = [[BSTabBarController alloc] init];
        AppDelegateWindow.rootViewController = tab;
    });

    
}


/*
获取验证码触发事件

@param verification 获取验证码Button对像
*/
- (void)getVerificationCode{
    if (!self.areacodeStr.length) {
        [OMGToast showWithText:@"区号不能为空" topOffset:64];
        return;
    }
    
    if (!self.phoneNumStr.length) {
       [OMGToast showWithText:@"手机号不能为空" topOffset:64];
        return;
    }
    
    self.timeCount =59;
    
    [self changeUI];
   
    
    self.getVCBtn.enabled =NO;
    
    self.timer =[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFunction:) userInfo:@"100" repeats:YES];
  
    NSMutableDictionary *dic =[NSMutableDictionary dictionary];
    dic[@"areaCode"]= self.areacodeStr;
    dic[@"phone"]= self.phoneNumStr;
    dic[@"captcha"] = self.captcha;
    
       __weak typeof(self) wself = self;
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           //结束定时器

            [LCProgressHUD showMessage:@"验证码已发请查收"];
              [self lDeallocTimer];
              [self sourceUI];
       });
    
}

- (void)sourceUI{
   self.getVCBtn.enabled =YES;
  // [self.getVCBtn setBackgroundColor:HEX_COLOR(0x02D8C9)];
  // [self.getVCBtn.titleLabel setTextColor:HEX_COLOR_ALPHA(0xFFFFFF,1.0)];
}

- (void)changeUI{
    OC_WeakSelf
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.getVCBtn setTitle:[NSString stringWithFormat:@"%lds",(long)weakSelf.timeCount] forState:UIControlStateDisabled];
    });
   
}


/**
短信获取验证码定时器倒计时

@param timer 定时器对象
*/
- (void)timerFunction:(NSTimer *)timer{
   
   // NSLog(@"%@",timer.userInfo);
   
   self.timeCount--;
   
   if (self.timeCount == 0) {
       
       [self lDeallocTimer];
       [self sourceUI];
       
   } else {
       
       [self changeUI];
       
   }
   
}


/**
销毁定时器
*/
-(void) lDeallocTimer{
   
   if ([self.timer isValid]) {
       [self.timer invalidate];
       self.timer=nil;
   }
}

- (void)dealloc{
   [self lDeallocTimer];
}


+(VerificationCode *)getAlertView {
    NSEnumerator *subviewsEnum = [OC_CurrentViewControl.view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            VerificationCode *hudView = (VerificationCode *)subview;
            return hudView;
        }
    }
    return nil;
}

@end
