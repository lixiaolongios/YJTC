//
//  Login_view.m
//  AC
//
//  Created by 徐天牧 on 2022/10/16.
//  Copyright © 2022 Moli. All rights reserved.
//

#import "Login_view.h"

@interface Login_view ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *mobileTextField;
@property (weak, nonatomic) IBOutlet UIButton *areaCodeButton;
@property (nonatomic, copy)NSString *areacodeStr;
@property (nonatomic, copy)NSString *phoneNumStr;
@property (weak, nonatomic) IBOutlet UILabel *areacodeL;

@end

@implementation Login_view
+ (Login_view *)showLogin_view {
    Login_view *view = [Login_view loadFromXib];
    view.frame = CGRectMake(0,StatusBarHeight, KSCREEN_WIDTH, KSCREEN_HEIGHT - StatusBarHeight - KTabbarHeight);
    [view layoutUI];
    return view;
}

- (void)layoutUI {
    
    self.areacodeStr =@"86";
    
    [self loginButtonChangeEvent];

    

    self.mobileTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号码" attributes:@{NSForegroundColorAttributeName:HEX_COLOR_ALPHA(0xA8A8A9,1.0)}];
    self.mobileTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.mobileTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
}

- (IBAction)mobileVerifyEvent:(UIButton *)sender {
   
    if (!self.phoneNumStr.length) {
        
        return;
    }
    
    __weak typeof(self) wself = self;
    
    InputVerificationCodeController *vc =[InputVerificationCodeController new];
    vc.fromVC =1000;
    vc.phoneNumStr =wself.phoneNumStr;
    vc.areacodeStr =wself.areacodeStr;
    [OC_CurrentNavigationViewControl pushViewController:vc animated:YES];
    

}



- (void)textFieldDidChange:(UITextField *)textField{
    
    NSString *mobilePhone=textField.text;
    self.phoneNumStr =mobilePhone;
    
    [self loginButtonChangeEvent];

}
- (void)loginButtonChangeEvent{
    if ([self.areacodeStr isEqualToString:@"86"] && self.phoneNumStr.length == 11) {
        [self loginButtonChange:YES];
        
    } else if (self.phoneNumStr.length && ![self.areacodeStr isEqualToString:@"86"]){
        [self loginButtonChange:YES];
        
    }else{
        [self loginButtonChange:NO];
    }
}
- (void)loginButtonChange:(BOOL)isChange {
    [self.loginButton setSelected:isChange];
    [self.loginButton setEnabled:isChange];
    
    [self.loginButton setBackgroundColor:HEX_COLOR_ALPHA(0x24D8DD,isChange ? 1.0 : 0.5)];
}


- (void)clearTextField
{
    if (self.mobileTextField) {
        self.mobileTextField.text =@"";
    }
}




@end
