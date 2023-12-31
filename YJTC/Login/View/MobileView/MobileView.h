//
//  MobileView.h
//  AC
//
//  Created by xujin on 2020/1/9.
//  Copyright © 2020 Moli. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^AreaCodeTapBlock)(void);
typedef void(^MobileTextFieldDidChangeBlock)(UITextField * _Nullable textField);

NS_ASSUME_NONNULL_BEGIN

@interface MobileView : UIView
@property (nonatomic,copy)AreaCodeTapBlock areaCodeTapBlock;
@property (nonatomic,copy)MobileTextFieldDidChangeBlock mobileTextFieldDidChangeBlock;
@property (nonatomic,assign)BOOL isMobileFirstResponder;

- (void)mobileResignFirstResponder;
- (void)mobileBecomeFirstResponder;

- (void)clearTextField;

- (void)nationalFlag:(NSString *)nationalFlag code:(NSString *)code;
@end

NS_ASSUME_NONNULL_END
