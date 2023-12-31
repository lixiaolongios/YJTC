//
//  ComEnum.h
//  HolaChat
//
//  Created by 徐天牧 on 2022/9/7.
//

#ifndef ComEnum_h
#define ComEnum_h

/**组类*/
typedef NS_ENUM(NSInteger, SectionType){
    /**首页-banner*/
    SectionType_Banner_H ,
    /**首页-功能区*/
    SectionType_FuncZone_H ,
    /**首页-语音匹配*/
    SectionType_ThemeCorner_H ,
    /**首页-Videor*/
    SectionType_Video_H ,
    /**首页-audio*/
    SectionType_Audio_H ,
    /**创建房间-标签*/
    SectionType_Tag_Cr_R ,
    /**创建房间-标题*/
    SectionType_Title_Cr_R ,
    /**创建房间-房间是有有密码*/
    SectionType_Password_Cr_R ,
    /**创建房间-房间背景**/
    SectionType_BG_Cr_R ,
    /**连线请求*/
    SectionType_Live_ConnectLine_By ,
    /**可能感兴趣的朋友**/
    SectionType_Live_ConnectLine_A ,
    /**我的-个人信息*/
    SectionType_Mine_Info ,
    /**我的-徽章*/
    SectionType_Mine_Badge ,
    /**我的-钱包**/
    SectionType_Mine_Money ,
    /**我的-任务*/
    SectionType_Mine_Task ,
    /**我的-设置**/
    SectionType_Mine_Setting ,
    /**订阅-标题**/
    SectionType_SubDetail_Title ,
    /**订阅-嘉宾**/
    SectionType_SubDetail_Guest ,
    /**订阅-介绍**/
    SectionType_SubDetail_Introduce ,
    
};



#endif /* ComEnum_h */
