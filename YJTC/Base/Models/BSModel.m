//
//  BSModel.m
//  AC
//
//  Created by xujin on 2018/11/16.
//  Copyright © 2018年 Moli. All rights reserved.
//

#import "BSModel.h"

@implementation BSModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{
             @"_id" : @"id", // _id 替换key   id 被替换id
             };
}

@end
