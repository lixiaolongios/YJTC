//
//  MobileView.m
//  AC
//
//  Created by xujin on 2020/1/9.
//  Copyright © 2020 Moli. All rights reserved.
//

#import "MobileView.h"
@interface  MobileView()
@property (nonatomic, weak) UITextField *mobileTextField;
@property (nonatomic, weak) UIButton *codeButton;
@property (nonatomic, weak) UIButton *nationalFlag;
@property (nonatomic, weak) UIButton *areaCodeButton;
@end

@implementation MobileView

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
    UIButton * codeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [codeButton setImage:[UIImage imageNamed:@"chinaLogin"] forState:UIControlStateNormal];
    [codeButton addTarget:self action:@selector(areaCodeButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:codeButton];
    self.codeButton =codeButton;
    
    UIButton *nationalFlag =[UIButton buttonWithType:UIButtonTypeCustom];
    [nationalFlag setTitle:@"+86" forState:UIControlStateNormal];
    [nationalFlag.titleLabel setFont:MEDIUM_FONT(16)];
    [nationalFlag setTitleColor:HEX_COLOR(0x3A3A3A) forState:UIControlStateNormal];
    [nationalFlag addTarget:self action:@selector(areaCodeButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:nationalFlag];
    self.nationalFlag =nationalFlag;
    
    UIButton *areaCodeButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [areaCodeButton setImage:[UIImage imageNamed:@"areaCode"] forState:UIControlStateNormal];
    [areaCodeButton addTarget:self action:@selector(areaCodeButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:areaCodeButton];
    self.areaCodeButton =areaCodeButton;
    
    UITextField *mobileTextField = [[UITextField alloc] init];
    mobileTextField.backgroundColor = [UIColor clearColor];
    [mobileTextField setTextColor:HEX_COLOR(0x000000)];
    mobileTextField.keyboardType = UIKeyboardTypeNumberPad;

    if (iPhone320) {
        mobileTextField.font = REGULAR_FONT(14);
    }else{
        mobileTextField.font = REGULAR_FONT(16);
    }
    
    mobileTextField.tag = 10000;
    mobileTextField.placeholder =@"please enter your phone";
   // mobileTextField.tintColor =HEX_COLOR_ALPHA(0x31D8D5,1.0);
    //    [self.mobileTextField setValue:MEDIUM_FONT(20) forKeyPath:@"_placeholderLabel.font"];
    //替换为
    mobileTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"please enter your phone"attributes:@{NSForegroundColorAttributeName:HEX_COLOR_ALPHA(0x9DA4AD,1.0)}];
    
    mobileTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [mobileTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:mobileTextField];
    self.mobileTextField =mobileTextField;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    @weakify(self)
    [self.codeButton mas_updateConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self).offset(10);
        make.width.height.mas_equalTo(KSCALEWidth(30));
        make.centerY.equalTo(self);
    }];
    [self.nationalFlag mas_updateConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.codeButton.mas_right).offset(5);
        make.top.bottom.equalTo(self);
    }];
    
    [self.areaCodeButton mas_updateConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.nationalFlag.mas_right).offset(5);
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(KSCALEWidth(18/2.0));
    }];
    
    [self.mobileTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.areaCodeButton.mas_right).offset(5);
        make.right.equalTo(self.mas_right).offset(-5);
        make.top.bottom.equalTo(self);
    }];

}


#pragma mark-
#pragma mark action event
- (void)areaCodeButtonEvent:(UIButton *)sender
{
    if (self.areaCodeTapBlock) {
        self.areaCodeTapBlock();
    }
    
}

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

- (void)nationalFlag:(NSString *)nationalFlag code:(NSString *)code
{
    if (nationalFlag) {
     //   [self.codeButton sd_setImageWithURL:[NSURL URLWithString:nationalFlag] forState:UIControlStateNormal placeholderImage:nil options:SDWebImageRetryFailed progress:nil completed:nil];
    }
   
    if (code) {
        [self.nationalFlag setTitle:code forState:UIControlStateNormal];
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
