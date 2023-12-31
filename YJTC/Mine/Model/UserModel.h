//
//  UserModel.h
//  AC
//
//  Created by xujin on 2018/11/16.
//  Copyright © 2018年 Moli. All rights reserved.
//

#import "BSModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface UserModel : BSModel

/*+++++++++++++++++++++++++++++++++++++++++*/
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *signInfo;  //个性签名
@property (nonatomic, copy) NSString *constellation; //星座
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *birthDay;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, assign) NSInteger sex; //sex:1男2女，0是未设置

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *accessToken; // token


/*++++++++++++++++++++++++++++++++*/
@end










NS_ASSUME_NONNULL_END
