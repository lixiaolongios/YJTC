//
//  UserModel.m
//  AC
//
//  Created by xujin on 2018/11/16.
//  Copyright © 2018年 Moli. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (id)copyWithZone:(NSZone *)zone{
    UserModel *user =[[[self class] allocWithZone:zone] init];
    user.userName =self.userName;
    user.userId =self.userId;
    user.signInfo =self.signInfo;
    user.constellation =self.constellation;
    
    user.age =self.age;
    user.birthDay =self.birthDay;
    user.city =self.city;
    user.gender =self.gender;
    user.sex =self.sex;
    
   
   
    user.signInfo =self.signInfo;
   
    user.uuid =self.uuid;
   
    user.accessToken =self.accessToken;
    
    
    return user;
}

@end
