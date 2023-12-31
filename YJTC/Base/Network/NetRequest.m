//
//  NetRequest.m
//  AC
//
//  Created by xujin on 2018/11/16.
//  Copyright © 2018年 Moli. All rights reserved.
//

#import "NetRequest.h"
#import "BSModel.h"

@implementation NetRequest

-(void)baseNetwork_startRequestWithcompletion:(RequestSuccessBlock)completion failure:(RequestFaileBlock)failure{
    
    
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
 //       [[[GlobalManager shareGlobalManager] global_currentViewControl] hiddenNoNetwork];
        
 //       DSLog(@"%@ \n %@",request,request.responseObject);
        
#if 0
        if(log_level == 1 ||
           log_level == 3){
            NSLog(@"%@ \n %@",request,request.responseObject);//
        }
        

        Class modelClass =self.modelClass;
        // 获取数据类型
        id resBody = request.responseObject[@"resBody"];
        
        BSModel *model;
        
        if (resBody && [resBody isKindOfClass:[NSDictionary class]]) {//字典
            model = [modelClass mj_objectWithKeyValues:resBody];
            model.code = [request.responseObject[@"code"] integerValue];
            model.message = request.responseObject[@"message"];
            model.total = [request.responseObject mol_jsonInteger:@"total"];
            
        }else{
            model =[self.modelClass mj_objectWithKeyValues:request.responseObject];
        }
        
        
        if([UserManagerInstance user_isLogin] &&  model.code  == 401){
            [OMGToast showWithText: model.message];
            dispatch_async(dispatch_get_main_queue(), ^{
                [[GlobalManager shareGlobalManager] global_modelLogout];
       
            });
            
            return;
        }
        else if ([UserManagerInstance user_isLogin] && model.code == 44444) {
            
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:LLNSLocalizedString(@"STR_ANSWER_QUESTION_PLS", nil) message:LLNSLocalizedString(@"STR_NEED_MEMBER_THEN_ANSWER", nil) preferredStyle:(UIAlertControllerStyleAlert)];
                
               // __weak typeof(self) wself = self;
                UIAlertAction *sure = [UIAlertAction actionWithTitle:LLNSLocalizedString(@"STR_CONFIRM_SEND", nil) style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                    
                        AnswerViewController *vc =[AnswerViewController new];
                        vc.answerType =AnswerType_Description;
                        [[[GlobalManager shareGlobalManager] global_currentNavigationViewControl] pushViewController:vc animated:YES];
                }];
                
                UIAlertAction *cancle = [UIAlertAction actionWithTitle:LLNSLocalizedString(@"STR_CANCEL", nil) style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                [alertVC addAction:cancle];
                [alertVC addAction:sure];
                
                [[[GlobalManager shareGlobalManager] global_currentViewControl] presentViewController:alertVC animated:YES completion:nil];
            
            
            
        }else if ([UserManagerInstance user_isLogin] && model.code == 11911) {
            
                [OMGToast showWithText: model.message];
                 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                     
                     [[GlobalManager shareGlobalManager] global_modelLogout];
            
                   
                });
                
        }
//        else{
//            if (completion) {
//                completion(request,model,model.code,model.message);
//            }
//        }
        
        if (completion) {
            completion(request,model,model.code,model.message);
        }
#endif
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
      //  NSLog(@"%@ \n %@",request, request.error.localizedDescription);
        
#if 0
        
        if (failure) {
            
          //  [LCProgressHUD showMessage:@"%@ \n %@",request,request.responseString];
            
          //  [OMGToast showWithText:[NSString stringWithFormat:@"%@ \n %@",request,request.responseString]];
            
           // NSLog(@"%@ \n %@",request,request.responseString);//
            Class modelClass =self.modelClass;
            
            BSModel *model ;
            model = [modelClass mj_objectWithKeyValues:request.responseString];
            
            if(model.code  == 401){
                [OMGToast showWithText: model.message];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[GlobalManager shareGlobalManager] global_modelLogout];
           
                });
                
                return;
            }
            
            
           // NSInteger resBody = request.responseStatusCode;
            
           // NSLog(@"%ld",resBody);
            
            if ([request.error.localizedDescription isEqualToString:LLNSLocalizedString(@"STR_AMOUST_DISCONNECT_INTERNET", nil)]) {
                [LCProgressHUD showMessage:LLNSLocalizedString(@"STR_NET_FAILED_AND_SUGGEST", nil)];
            }else{
                [OMGToast showWithText:[NSString stringWithFormat:@"%@",request.error.localizedDescription]];
            }
            
            
            failure(request);
        }
        
#endif
        
    }];
    
}


@end
