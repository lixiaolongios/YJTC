

/*+++++++++++++++++++HOST++++++++++++++++*/
/// 正式服
NSString *const RELEASE_SERVICE_HOST = @"https://api.urmoli.com/";

NSString *const RELEASE_SERVICE_H5_HOST = @"https://web.urmoli.com/";

NSString *const RELEASE_WEBSOCKET_HOST = @"ws://ws.acjiaoliudian.com/";
//NSString *const RELEASE_WEBSOCKET_HOST = @"ws://192.168.1.61:8602/";

/// 测试服
//NSString *const DEBUG_SERVICE_HOST = @"http://47.92.147.81:8601/";
NSString *const DEBUG_SERVICE_HOST = @"https://dev-api.urmoli.com/";

NSString *const DEBUG_SERVICE_H5_HOST = @"https://dev-web.urmoli.com";

NSString *const DEBUG_WEBSOCKET_HOST = @"ws://47.92.147.81:8602/";

//本地
//NSString *const DEBUG_WEBSOCKET_HOST = @"ws://192.168.1.61:8602/";

/*+++++++++++++++++++Status Code++++++++++++++++*/
/// 请求成功code码 10000
NSInteger const SUCCESS_REQUEST = 10000;

/*+++++++++++++++++++NSNotification Name++++++++++++++++*/
/// 用户登录成功
NSString *const SUCCESS_USER_LOGIN = @"LOGIN_SUCCESS";

/// 用户退出登录
NSString *const SUCCESS_USER_LOGINOUT =@"LOGINOUT";

/// 加入书架成功
NSString *const SUCCESS_BOOKSHELF_ADDED =@"SUCCESS_BOOKSHELF_ADDED";

/// 兴趣爱好选取时 开始阅读事件
NSString *const PREFERENCE_START_NOTIF =@"PREFERENCE_START_NOTIF";

/// 开始阅读通知
NSString *const READER_START_NOTIF =@"READER_START_NOTIF";

/// 消息通知
NSString *const IM_NOTIF =@"IM_NOTIF";

/// 取消消息红点通知
NSString *const IM_CancelRedDot_NOTIF =@"IM_CancelRedDot_NOTIF";

/// 获取我的钱包通知
NSString *const GET_MYWALLET_NOTIF =@"GET_MYWALLET_NOTIF";


NSString *const kWebSocketDidReceiveMessage                     =@"KWebSocketDidReceiveMessage";
NSString *const KROLE_SELECTED_NOTIF                            =@"KROLE_SELECTED_NOTIF";

NSString *const kQINIU_OPEN_SPEAKER                     =@"kQINIU_OPEN_SPEAKER";
NSString *const KQINIU_OPEN_MUTE                            =@"KQINIU_OPEN_MUTE";
NSString *const kWebSocket2DidReceiveMessage                     =@"KWebSocket2DidReceiveMessage";

//房主补充空位角色
NSString *const KROLE_ROOMMAIN_SELECTED_VACANT_NOTIF                            =@"KROLE_ROOMMAIN_SELECTED_VACANT_NOTIF";


/// 录音解析文字时长
CGFloat const JA_IFLY_Time = 30;

/*+++++++++++++++++++++++++++++++++++*/

//大陆通知的数量本都存储的key
NSString *const ACGROUPUNREADCOUNT = @"ACGROUPUNREADCOUNT";

NSString *const ACCALLSCREENTALKINGPIOPLE = @"ACCALLSCREENTALKINGPIOPLE";
NSString *const ACBigSCREENTALKINGPIOPLE = @"ACBigSCREENTALKINGPIOPLE";



