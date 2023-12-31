//
//  SPBaseLoginVC.m
//  SuperPig
//
//  Created by Moli on 2020/11/7.
//  Copyright © 2020 Moli. All rights reserved.
//

#import "SPBaseLoginVC.h"

@interface SPBaseLoginVC ()

@end

@implementation SPBaseLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   // self.view.backgroundColor = HEX_COLOR(0x1E1B29);
    [self showTopImageView:@""];
}

- (void)showTopImageView:(NSString *)backBtnName
{
    
//    UIImageView *centerImv = [UIImageView new];
//    [self.view addSubview:centerImv];
//    centerImv.image = [UIImage imageNamed:@"AC_Login_中部背景图"];
    
    UIImageView *topImv = [UIImageView new];
    [self.view addSubview:topImv];
    topImv.image = [UIImage imageNamed:@"login_icon"];
    
    OC_WeakSelf
    [topImv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(68-20+StatusBarHeight);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
    }];
    
//    [centerImv mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(self.view);
//        make.top.mas_equalTo(topImv.mas_bottom).offset(-35);
//        make.height.mas_equalTo(KSCALEHeight(210));
//    }];
    
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.view addSubview:backBtn];
//    [backBtn setImage:[UIImage imageNamed:backBtnName] forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(popSelfAction) forControlEvents:UIControlEventTouchUpInside];
//
//    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view).offset(20);
//        make.top.mas_equalTo(self.view).offset(35);
//        make.height.width.mas_equalTo(30);
//    }];
    
}

@end
