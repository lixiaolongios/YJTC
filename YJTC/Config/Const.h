//
//  Const.h
//  AC
//
//  Created by xujin on 2018/11/16.
//  Copyright © 2018年 Moli. All rights reserved.
//

#import <UIKit/UIKit.h>

/*+++++++++++++++++++HOST++++++++++++++++*/
/// 正式服
UIKIT_EXTERN NSString *const RELEASE_SERVICE_HOST;
UIKIT_EXTERN NSString *const RELEASE_SERVICE_H5_HOST;
UIKIT_EXTERN NSString *const RELEASE_WEBSOCKET_HOST;

/// 测试服
UIKIT_EXTERN NSString *const DEBUG_SERVICE_HOST;
UIKIT_EXTERN NSString *const DEBUG_SERVICE_H5_HOST;
UIKIT_EXTERN NSString *const DEBUG_WEBSOCKET_HOST;


/*+++++++++++++++++++Status Code++++++++++++++++*/
/// 请求成功code码 10000
UIKIT_EXTERN NSInteger const SUCCESS_REQUEST;

/*+++++++++++++++++++NSNotification Name++++++++++++++++*/
UIKIT_EXTERN NSString *const SUCCESS_USER_LOGIN;

UIKIT_EXTERN NSString *const SUCCESS_USER_LOGINOUT;

UIKIT_EXTERN NSString *const SUCCESS_BOOKSHELF_ADDED;

UIKIT_EXTERN NSString *const PREFERENCE_START_NOTIF;

UIKIT_EXTERN NSString *const READER_START_NOTIF;

UIKIT_EXTERN NSString *const IM_NOTIF;

UIKIT_EXTERN NSString *const IM_CancelRedDot_NOTIF;

UIKIT_EXTERN NSString *const GET_MYWALLET_NOTIF;

//WebSocket收到消息的通知
UIKIT_EXTERN NSString *const kWebSocketDidReceiveMessage;
UIKIT_EXTERN NSString *const kWebSocket2DidReceiveMessage;

UIKIT_EXTERN NSString *const KROLE_SELECTED_NOTIF;


UIKIT_EXTERN NSString *const kQINIU_OPEN_SPEAKER;
UIKIT_EXTERN NSString *const KQINIU_OPEN_MUTE;

/// 录音解析文字时长
UIKIT_EXTERN CGFloat const JA_IFLY_Time;

///房主补充空位角色通知
UIKIT_EXTERN NSString *const KROLE_ROOMMAIN_SELECTED_VACANT_NOTIF;

extern NSString * const  ACGROUPUNREADCOUNT;

extern NSString *const ACCALLSCREENTALKINGPIOPLE;//全屏下接受多少个上麦用户的Key
extern NSString *const ACBigSCREENTALKINGPIOPLE;






/*++++++++++++++++++++++++++++++++++++++*/
