//
//  PasswordView.h
//  AC
//
//  Created by xujin on 2020/1/10.
//  Copyright © 2020 Moli. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MobileTextFieldDidChangeBlock)(UITextField * _Nullable textField);
NS_ASSUME_NONNULL_BEGIN

@interface PasswordView : UIView
@property (nonatomic,copy)MobileTextFieldDidChangeBlock mobileTextFieldDidChangeBlock;
@property (nonatomic,assign)BOOL isMobileFirstResponder;

- (void)mobileResignFirstResponder;
- (void)mobileBecomeFirstResponder;

- (void)clearTextField;

- (void)placeString:(NSString *)placeString;
@end

NS_ASSUME_NONNULL_END
