//
//  InputVerificationCodeController.m
//  AC
//
//  Created by xujin on 2020/1/10.
//  Copyright © 2020 Moli. All rights reserved.
//

#import "InputVerificationCodeController.h"
//#import "VerificationCodeView.h"




@interface InputVerificationCodeController ()

@property (nonatomic, weak)VerificationCodeView *verificationCode;
@property (nonatomic, copy)NSString *codeStr;
@property (nonatomic, weak) UIButton *getVCBtn;



@end

@implementation InputVerificationCodeController
//- (BOOL)showNavigation{
//    return YES;
//}

- (void)viewDidLoad {
   
    // Do any additional setup after loading the view.
    
    [self.view addSubview: [VerificationCode showVerificationCode:self.areacodeStr phoneNumStr:self.phoneNumStr fromVC:self.fromVC]];;
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(captchaEvent:) name:@"captchaNotification" object:nil];

}

- (void)captchaEvent:(NSNotification *)notif {
    NSString *captcha = notif.object;
    [VerificationCode getAlertView].captcha = captcha;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
