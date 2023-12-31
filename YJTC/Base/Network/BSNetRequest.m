//
//  BSNetRequest.m
//  AC
//
//  Created by xujin on 2018/11/15.
//  Copyright © 2018年 Moli. All rights reserved.


#import "BSNetRequest.h"
#import "BSModel.h"
#import "UserModel.h"



@implementation BSNetRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary{
    
    NSMutableDictionary *headerDictionary =[NSMutableDictionary dictionary];

    return headerDictionary;
    
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

- (NSTimeInterval)requestTimeoutInterval
{
    return 15;
}

- (BOOL)statusCodeValidator {
    return YES;
}

- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeJSON;
}


- (Class)modelClass
{
    return [BSModel class];
}




@end


