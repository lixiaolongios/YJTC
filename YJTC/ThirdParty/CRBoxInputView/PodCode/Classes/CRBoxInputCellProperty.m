//
//  CRBoxInputself.m
//  CaiShenYe
//
//  Created by Chobits on 2019/1/3.
//  Copyright © 2019 Chobits. All rights reserved.
//

#import "CRBoxInputCellProperty.h"
#import <Masonry/Masonry.h>


@implementation CRBoxInputCellProperty

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        __weak typeof(self) weakSelf = self;
        
        // UI
        self.borderWidth = (0.0);
        self.cellBorderColorNormal =
        self.cellBorderColorNormal = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:250/255.0 alpha:1];
        self.cellBorderColorSelected = [UIColor colorWithRed:255/255.0 green:70/255.0 blue:62/255.0 alpha:1];
        self.cellBorderColorFilled = nil;
       // self.cellBgColorNormal = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:250/255.0 alpha:1];
        self.cellBgColorNormal = UIColor.clearColor;
        
      // self.cellBgColorSelected = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:250/255.0 alpha:1];
        self.cellBgColorSelected = UIColor.clearColor;
        self.cellBgColorFilled = nil;
        self.cellCursorColor = [UIColor colorWithRed:80/255.0 green:227/255.0 blue:194/255.0 alpha:1];
        self.cellCursorWidth = 2;
        self.cellCursorHeight = 28;
        //self.cornerRadius = 5;
        self.cornerRadius = 0;
        
        // line
        self.showLine = NO;
        
        // label
        self.cellFont = [UIFont systemFontOfSize:20];
        self.cellTextColor = [UIColor whiteColor];
        
        // Security
        self.ifShowSecurity = NO;
        self.securitySymbol = @"✱";
        self.originValue = @"";
        self.securityType = CRBoxSecuritySymbolType;
        
        // Placeholder
        self.cellPlaceholderText = nil;
        self.cellPlaceholderTextColor = UIColor.whiteColor;
        //[UIColor colorWithRed:114/255.0 green:116/255.0 blue:124/255.0 alpha:0.3];
        self.cellPlaceholderFont = [UIFont systemFontOfSize:20];
        
        // Block
        self.customSecurityViewBlock = ^UIView * _Nonnull{
            return [weakSelf defaultCustomSecurityView];
        };
        self.customLineViewBlock = ^CRLineView * _Nonnull{
            return [CRLineView new];
        };
        self.configCellShadowBlock = nil;
        
        // Test
        self.index = 0;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    CRBoxInputCellProperty *copy = [[self class] allocWithZone:zone];
    
    // UI
    copy.borderWidth = _borderWidth;
    copy.cellBorderColorNormal = [_cellBorderColorNormal copy];
    copy.cellBorderColorSelected = [_cellBorderColorSelected copy];
    if (_cellBorderColorFilled) {
        copy.cellBorderColorFilled = [_cellBorderColorFilled copy];
    }
    copy.cellBgColorNormal = [_cellBgColorNormal copy];
    copy.cellBgColorSelected = [_cellBgColorSelected copy];
    if (_cellBgColorFilled) {
        copy.cellBgColorFilled = [_cellBgColorFilled copy];
    }
    copy.cellCursorColor = [_cellCursorColor copy];
    copy.cellCursorWidth = _cellCursorWidth;
    copy.cellCursorHeight = _cellCursorHeight;
    copy.cornerRadius = _cornerRadius;
    
    // line
    copy.showLine = _showLine;
    
    // label
    copy.cellFont = [_cellFont copy];
    copy.cellTextColor = [_cellTextColor copy];
    
    // Security
    copy.ifShowSecurity = _ifShowSecurity;
    copy.securitySymbol = [_securitySymbol copy];
    copy.originValue = [_originValue copy];
    copy.securityType = _securityType;
    
    // Placeholder
    if (_cellPlaceholderText) {
        copy.cellPlaceholderText = [_cellPlaceholderText copy];
    }
    copy.cellPlaceholderTextColor = [_cellPlaceholderTextColor copy];
    copy.cellPlaceholderFont = [_cellPlaceholderFont copy];
    
    // Block
    copy.customSecurityViewBlock = [_customSecurityViewBlock copy];
    copy.customLineViewBlock = [_customLineViewBlock copy];
    if (_configCellShadowBlock) {
        copy.configCellShadowBlock = [_configCellShadowBlock copy];
    }
    
    // Test
    copy.index = _index;
    
    return copy;
}

- (UIView *)defaultCustomSecurityView
{
    UIView *customSecurityView = [UIView new];
    customSecurityView.backgroundColor = [UIColor clearColor];
    
    // circleView
    static CGFloat circleViewWidth = 20;
    UIView *circleView = [UIView new];
    circleView.backgroundColor = [UIColor blackColor];
    circleView.layer.cornerRadius = 4;
    [customSecurityView addSubview:circleView];
    [circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(circleViewWidth);
        make.centerX.offset(0);
        make.centerY.offset(0);
    }];
    
    return customSecurityView;
}

@end
