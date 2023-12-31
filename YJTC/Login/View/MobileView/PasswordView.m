//
//  PasswordView.m
//  AC
//
//  Created by xujin on 2020/1/10.
//  Copyright © 2020 Moli. All rights reserved.
//

#import "PasswordView.h"
@interface  PasswordView()
@property (nonatomic, weak) UITextField *mobileTextField;
@property (nonatomic, weak) UIButton *eyeButton;
@end

@implementation PasswordView
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
    mobileTextField.keyboardType = UIKeyboardTypeASCIICapable;
    mobileTextField.font = REGULAR_FONT(16);
    mobileTextField.tag = 10001;
   // mobileTextField.returnKeyType =UIReturnKeyGo;
    
    mobileTextField.tintColor =HEX_COLOR_ALPHA(0x31D8D5,1.0);
    //    [self.mobileTextField setValue:MEDIUM_FONT(20) forKeyPath:@"_placeholderLabel.font"];
    
    mobileTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [mobileTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:mobileTextField];
    self.mobileTextField =mobileTextField;
    
    
    UIButton *eyeButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [eyeButton setImage:[UIImage imageNamed:@"jiami"] forState:UIControlStateNormal];
    [eyeButton setImage:[UIImage imageNamed:@"xiainshi"] forState:UIControlStateSelected];
    [eyeButton addTarget:self action:@selector(eyeEvent:) forControlEvents:UIControlEventTouchUpInside];
    [eyeButton setSelected:YES];
    [self addSubview:eyeButton];
    self.eyeButton =eyeButton;
    
    [self eyeEvent:eyeButton];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    @weakify(self)
    [self.mobileTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.eyeButton.mas_left);
        make.top.bottom.equalTo(self);
    }];
    
    [self.eyeButton mas_updateConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.mobileTextField.mas_right);
        make.right.equalTo(self.mas_right).offset(-5);
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(self.eyeButton.height);
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

- (void)eyeEvent:(UIButton *)sender
{
    sender.selected =!sender.isSelected;
    if (sender.isSelected) {//睁眼
        if (self.mobileTextField) {
            [self.mobileTextField setSecureTextEntry:NO];
        }

    }else{//闭眼
        if (self.mobileTextField) {
            [self.mobileTextField setSecureTextEntry:YES];
        }

    }
    
}

- (void)placeString:(NSString *)placeString
{
    if (placeString.length) {
        self.mobileTextField.placeholder =placeString;
        //替换为
      //  self.mobileTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeString attributes:@{NSForegroundColorAttributeName:HEX_COLOR_ALPHA(0x9DA4AD,1.0)}];
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
