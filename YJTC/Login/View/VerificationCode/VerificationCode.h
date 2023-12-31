//
//  VerificationCode.h
//  AC
//
//  Created by 徐天牧 on 2022/10/16.
//  Copyright © 2022 Moli. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface VerificationCode : BaseView
+ (VerificationCode *)showVerificationCode:(NSString *)areacodeStr phoneNumStr:(NSString *)phoneNumStr fromVC:(NSInteger)fromVC;
+ (VerificationCode *)getAlertView;
@property (nonatomic, copy) NSString *captcha;

/**
销毁定时器
*/
-(void) lDeallocTimer;

@end

NS_ASSUME_NONNULL_END
