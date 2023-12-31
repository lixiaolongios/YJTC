//
//  ColorKit.h
//  AC
//
//  Created by xujin on 2018/11/15.
//  Copyright © 2018年 Moli. All rights reserved.
//

#ifndef ColorKit_h
#define ColorKit_h

//****************************** 颜色 ***************************** //
// 十六进制颜色值 使用：HEX_COLOR(0xf8f8f8)
#define HEX_COLOR_ALPHA(_HEX_,a) [UIColor colorWithRed:((float)((_HEX_ & 0xFF0000) >> 16))/255.0 green:((float)((_HEX_ & 0xFF00) >> 8))/255.0 blue:((float)(_HEX_ & 0xFF))/255.0 alpha:a]

#define HEX_COLOR(_HEX_) HEX_COLOR_ALPHA(_HEX_, 1.0)

#define RGB_COLOR_ALPHA(r, g, b, a) [UIColor colorWithRed:(CGFloat)r/255.0f green:(CGFloat)g/255.0f blue:(CGFloat)b/255.0f alpha:a]
#define RGB_COLOR(r, g, b) RGB_COLOR_ALPHA(r, g, b, 1.0)

#define c_ffffff   HEX_COLOR(0xffffff)
#define c_000000   HEX_COLOR(0x000000)
#define MAIN_COLOR  HEX_COLOR(0x161823)
#define c_31D8D5   HEX_COLOR(0x31D8D5)
#define c_00D8C9   HEX_COLOR(0x00D8C9)
#define c_656565   HEX_COLOR(0x656565)
#define Line_COLOR  HEX_COLOR(0x2c2e38)
#define BoxInput_COLOR  HEX_COLOR(0x2e2f39)
#define BoxInputText_COLOR  HEX_COLOR(0xBEBEC0)


#define JA_Line 0xEDEDED
#define JA_Green 0x6BD379
#define JA_Red 0xff4d4d
#define JA_Background 0xFFFFFF
#define JA_BoardLineColor 0xF9F9F9
#define JA_BtnGrounddColor 0xF5F5F5
#define JA_backGrayColor 0xEBEBEB

#define JA_BlackTitle 0x363636
#define JA_BlackSubTitle 0x9B9B9B
#define JA_BlackSubSubTitle 0xC6C6C6

#define JA_Title 0x525252
#define JA_Branch_Green 0x31C27C
#define JA_Three_Title 0x444444

#define JA_Blue_Title 0x576b95
#define JA_GrayColor 0x9C9CA4
#define JA_GaryTitle 0xC6C6CE
#define JA_ListTitle 0x5D5F6A



typedef NS_ENUM(NSInteger,BusinessFunctionType) {
   /*++++++++++++++++++++++首页++++++++++++++++++++++*/
    BusinessFunctionType_User,                  //用户信息
    BusinessFunctionType_Banner,                //Banner-圆桌会议
    BusinessFunctionType_RTAModules,            //排行榜、任务、剧本库、查找和建房间模块
    BusinessFunctionType_HomeRoomModules,       //房间模块
    BusinessFunctionType_RecommendScript,       //全栈推荐live
    
   /*++++++++++++++++++++++剧本详情++++++++++++++++++++++*/
    BusinessFunctionType_ScriptDetail_Role,     //剧本详情-角色
    BusinessFunctionType_ScriptDetail_Synopsis, //剧本详情-简介
    BusinessFunctionType_ScriptDetail_Lines,    //剧本详情-台词
    
    BusinessFunctionType_Category,       //类别
    BusinessFunctionType_RoomNotice,     //根据房间分区查询分区公告
    
};

typedef NS_ENUM(NSInteger,BusinessSubFunctionType) {
    BusinessSubFunctionType_Ranking,            //排行榜
    BusinessSubFunctionType_Task,               //任务
    BusinessSubFunctionType_ScriptLibrary,      //剧本库
    BusinessSubFunctionType_TheaterHall,        //剧场大厅
    BusinessSubFunctionType_QuickStart,         //快速开始
    BusinessSubFunctionType_CreateRoom,         //创建房间
    
};

typedef NS_ENUM(NSInteger,NoviceFunctionType) {
    /*++++++++++++++++++++++新手展示++++++++++++++++++++++*/
    NoviceFunctionType_Home,                        //首页
    NoviceFunctionType_ReadyRoomAIHead,             //准备房间AI头像提示
    NoviceFunctionType_ReadyRoomSelectRow,          //准备房间选角色提示
    NoviceFunctionType_ReadyRoomReady,              //准备房间准备提示
    NoviceFunctionType_ReadyRoomSelectRowReady,    //准备房间选中角色准备提示
    NoviceFunctionType_StartRoomRemainingRTime,     //开始房间剩余时间提示
    NoviceFunctionType_EndRoomPerfectSuccess,       //结束房间挑战完美通过提示
    NoviceFunctionType_EndRoomSuccess,              //结束房间挑战成功提示
    NoviceFunctionType_EndRoomFailure,              //结束房间挑战失败提示
    NoviceFunctionType_Genera,                      //通用提示
};

typedef NS_ENUM(NSInteger,BusinessTopicType) {
    BusinessTopicType_Recommend,    //推荐话题
    BusinessTopicType_Selected,     //已选话题
    BusinessTopicType_Creation,     //创建话题
    BusinessTopicType_More,         //更多话题
    BusinessTopicType_Matched,      //已匹配话题
};

typedef NS_ENUM(NSInteger, UIBehaviorTypeStyle) {
    UIBehaviorTypeStyle_Normal,     //初始化
    UIBehaviorTypeStyle_Refresh,    //下拉刷新
    UIBehaviorTypeStyle_More,        //上拉加载更多
};

/// Full screen mode
typedef NS_ENUM(NSUInteger, XLFullScreenMode) {
    XLFullScreenModeAutomatic,  // Determine full screen mode automatically
    XLFullScreenModeLandscape,  // Landscape full screen mode
    XLFullScreenModePortrait    // Portrait full screen Model
};


typedef NS_ENUM(NSInteger, ShareViewType) {
    ShareViewANYQ,               //站内邀请
    ShareViewWechat,             // 朋友圈
    ShareViewWeixin,             // 微信
    ShareViewQQ,                 // QQ
    ShareViewMqMzone,            // QQ空间
    ShareViewSinaweibo,          // 微博
    ShareViewReport,             // 举报
    ShareViewCopyUrl,            // 复制链接
    ShareViewDelete,             // 删除
    ShareViewCancel,             // 取消
   
};

#endif /* ColorKit_h */
