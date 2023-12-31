//
//  VerificationCodeView.m
//  AC
//
//  Created by xujin on 2020/1/10.
//  Copyright © 2020 Moli. All rights reserved.
//

#import "VerificationCodeView.h"
@interface  VerificationCodeView()
@property (nonatomic, weak) UITextField *mobileTextField;
@end

@implementation VerificationCodeView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
        [self layoutUI];
    }
    return self;
}

- (void)initData
{
    
}

- (void)layoutUI
{
    UITextField *mobileTextField = [[UITextField alloc] init];
    mobileTextField.backgroundColor = [UIColor clearColor];
    [mobileTextField setTextColor:HEX_COLOR(0x393939)];
    mobileTextField.keyboardType = UIKeyboardTypeNumberPad;
    mobileTextField.font = REGULAR_FONT(16);
    mobileTextField.tag = 10001;
    mobileTextField.placeholder =@"Verification code";
    mobileTextField.tintColor =HEX_COLOR_ALPHA(0x31D8D5,1.0);
    //    [self.mobileTextField setValue:MEDIUM_FONT(20) forKeyPath:@"_placeholderLabel.font"];
    //替换为
    mobileTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Verification code"attributes:@{NSForegroundColorAttributeName:HEX_COLOR_ALPHA(0x9DA4AD,1.0)}];
    
    mobileTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [mobileTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:mobileTextField];
    self.mobileTextField =mobileTextField;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    @weakify(self)
    [self.mobileTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_right).offset(-5);
        make.top.bottom.equalTo(self);
    }];

}


#pragma mark-
#pragma mark action event
- (void)textFieldDidChange:(UITextField *)textField{
    if (self.mobileTextFieldDidChangeBlock) {
        self.mobileTextFieldDidChangeBlock(textField);
    }
}

- (void)mobileResignFirstResponder
{
    self.isMobileFirstResponder =NO;
    if (self.mobileTextField) {
        [self.mobileTextField resignFirstResponder];
    }
}
- (void)mobileBecomeFirstResponder
{
    if (self.mobileTextField) {
        [self.mobileTextField becomeFirstResponder];
    }
    
}

- (void)clearTextField
{
    if (self.mobileTextField) {
        self.mobileTextField.text =@"";
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
