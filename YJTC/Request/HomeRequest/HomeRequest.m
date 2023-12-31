//
//  RoomApi.m
//  AC
//
//  Created by xujin on 2019/3/12.
//  Copyright © 2019年 Moli. All rights reserved.
//

#import "HomeRequest.h"
#import "BSModel.h"

typedef NS_ENUM(NSUInteger, RoomApiType) {
    RoomApiType_Room_Create, //创建房间
    RoomApiType_Room_List, //房间列表
    RoomApiType_Room_BackGround, //创建房间背景图列表
    RoomApiType_RoomHall_WebSocket, //首页房间列表socket
    RoomApiType_Room_BatchQueryRoom, //批量查询房间
    RoomApiType_EnterRoom, //进入房间
    RoomApiType_RoomConf,    //查询房主功能列表
    RoomApiType_Room_ConnectorList, //房间连麦和排麦列表
    RoomApiType_CrossRoom_ConnectorList, //跨房连麦列表
    RoomApiType_TencentAsrSts, //获取临时语音授权
    RoomApiType_RoomConfig, //房间配置
    RoomUserAssetRoomCardStatus, //房间创建前和进行中 用户房卡道具状态
    RoomUserAssetRoomCardStatus_, //房间创建前和进行中 用户房卡道具状态
    RoomDurationRenewBefore, // 房间续时前 房卡或钻石
    RoomDurationRenew, // 房间续时 房卡或钻石
    RoomApiType_roomInfo, // 单个房间信息
    RoomApiType_roomApply, //
    RoomApiType_roomProfile,//
    RoomApiType_Room_Tag_List,
    
    ThemeCornerList, //主题列表
    ThemeCornerInfo, //主题详情
    PairRoomConfig, //匹配房配置
    ThemeCornerUserApply, //主题用户预约
    ThemeCornerCheckOrBuyLimit, //检查或购买匹配次数
    PairRoomVote, //匹配房(结束) 点赞
    PairRoomCloseResult, // 匹配房 关闭结果
    RoomCloseResult, //房间关闭结果
    
};



@interface HomeRequest ()
@property (nonatomic, assign) RoomApiType type;
@property (nonatomic, strong) NSDictionary *parameter;
@property (nonatomic, strong) NSString *parameterId;
@end


@implementation HomeRequest


//[0.9.92 add] 房间关闭结果 /room/{roomId}/closeResult  // roomId 匹配房的id
- (id)initRoomCloseResultWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId {
    self = [super init];
    if (self) {
        _type = RoomCloseResult;
        _parameter = parameter;
        _parameterId =parameterId;
        
    }
    return self;
}

//[0.9.92 add] 匹配房 关闭结果 {{baseUrl}}/pairRoom/{roomId}/closeResult  // roomId 匹配房的id
- (id)initPairRoomCloseResultWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId {
    self = [super init];
    if (self) {
        _type = PairRoomCloseResult;
        _parameter = parameter;
        _parameterId =parameterId;
        
    }
    return self;
}

//[0.9.92 add] 匹配房(结束) 点赞 /pairRoom/1/vote
- (id)initPairRoomVoteWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId {
    self = [super init];
    if (self) {
        _type = PairRoomVote;
        _parameter = parameter;
        _parameterId =parameterId;
        
    }
    return self;
    
}
///[0.9.92 add] 检查或购买匹配次数 /themeCorner/checkOrBuyLimit
- (id)initThemeCornerCheckOrBuyLimitWithParameter:(NSDictionary *)parameter {
    self = [super init];
    if (self) {
        _type =ThemeCornerCheckOrBuyLimit;
        _parameter = parameter;
        
    }
    return self;
}

///[0.9.92 add] 主题用户预约 /themeCorner/userApply
- (id)initThemeCornerUserApplyWithParameter:(NSDictionary *)parameter {
    self = [super init];
    if (self) {
        _type =ThemeCornerUserApply;
        _parameter = parameter;
        
    }
    return self;
}

///themeCorner/list 主题列表
- (id)initThemeCornerListWithParameter:(NSDictionary *)parameter {
    self = [super init];
    if (self) {
        _type =ThemeCornerList;
        _parameter = parameter;
        
    }
    return self;
}
///
///
////themeCorner/{id}/info  主题详情
- (id)initThemeCornerInfoWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId {
    self = [super init];
    if (self) {
        _type =ThemeCornerInfo;
        _parameter = parameter;
        _parameterId =parameterId;
        
    }
    return self;
}

////pairRoom/{roomId}/config    roomId: 匹配房id    匹配房配置
- (id)initPairRoomConfigWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId {
    self = [super init];
    if (self) {
        _type =PairRoomConfig;
        _parameter = parameter;
        _parameterId =parameterId;
        
    }
    return self;
}


///room/{roomId}/roomInfo       /room/roomProfile/{roomId}
- (id)initRoomProfileWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId {
    self = [super init];
    if (self) {
        _type =RoomApiType_roomProfile;
        _parameter = parameter;
        _parameterId =parameterId;
        
    }
    return self;
}

///baseUrl}}/room/roomApply
- (id)initRoomApplyWithParameter:(NSDictionary *)parameter {
    self = [super init];
    if (self) {
        _type =RoomApiType_roomApply;
        _parameter = parameter;
        
    }
    return self;
}
///room/{roomId}/roomInfo
- (id)initRoomInfoWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId {
    self = [super init];
    if (self) {
        _type =RoomApiType_roomInfo;
        _parameter = parameter;
        _parameterId =parameterId;
    }
    return self;
}
////api/room/{roomId}/durationRenewBefore 房间续时前 房卡或钻石
- (id)initRoomDurationRenewBeforeWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId {
    self = [super init];
    if (self) {
        _type =RoomDurationRenewBefore;
        _parameter = parameter;
        _parameterId =parameterId;
    }
    return self;
}


////​/api​/room​/{roomId}​/durationRenew 房间续时 房卡或钻石
- (id)initRoomDurationRenewWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId {
    self = [super init];
    if (self) {
        _type =RoomDurationRenew;
        _parameter = parameter;
        _parameterId =parameterId;
    }
    return self;
    
}
////api/room/userAsset/roomCard/status 房间创建前和进行中 用户房卡道具状态
- (id)initRoomUserAssetRoomCardStatusWithParameter:(NSDictionary *)parameter {
    self = [super init];
    if (self) {
        _type =RoomUserAssetRoomCardStatus_;
        _parameter = parameter;
        
    }
    return self;
}

///api/room/{roomId}/userAsset/roomCard/status 房间创建前和进行中 用户房卡道具状态
- (id)initRoomUserAssetRoomCardStatusWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId {
    self = [super init];
    if (self) {
        _type =RoomUserAssetRoomCardStatus;
        _parameter = parameter;
        _parameterId =parameterId;
    }
    return self;
}

// /api/room/{roomId}/config 房间配置
- (id)initRoomConfigWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId {
    self = [super init];
    if (self) {
        _type =RoomApiType_RoomConfig;
        _parameter = parameter;
        _parameterId =parameterId;
    }
    return self;
}

//POST /room/create  创建房间
- (id)initRoomCreateWithParameter:(NSDictionary *)parameter{
    self = [super init];
    if (self) {
        _type =RoomApiType_Room_Create;
        _parameter = parameter;
    }
    return self;
}

//POST /room/list 房间列表
- (id)initRoomListWithParameter:(NSDictionary *)parameter
{
    self = [super init];
    if (self) {
        _type = RoomApiType_Room_List;
        _parameter = parameter;
    }
    return self;
}

//POST /room/tag/list 房间 标签列表
- (id)initRoomTagListWithParameter:(NSDictionary *)parameter
{
    self = [super init];
    if (self) {
        _type = RoomApiType_Room_Tag_List;
        _parameter = parameter;
    }
    return self;
}

//POST /room/backgroundGoodsList 房间背景商品列表
- (id)initRoomBackGroundGoodsListWithParameter:(NSDictionary *)parameter
{
    self = [super init];
    if (self) {
        _type = RoomApiType_Room_BackGround;
        _parameter = parameter;
    }
    return self;
}

// POST /room/hallWebSocket  大厅websocket地址
- (id)initRoomHallWebSocketWithParameter:(NSDictionary *)parameter
{
    
    self = [super init];
    if (self) {
        _type = RoomApiType_RoomHall_WebSocket;
        _parameter = parameter;
        
    }
    return self;
    
}

//POST /批量查询房间信息
- (id)initRoomBatchQueryRoomWithParameter:(NSDictionary *)parameter
{
    self = [super init];
    if (self) {
        _type = RoomApiType_Room_BatchQueryRoom;
        _parameter = parameter;
        
        
    }
    return self;
    
}

//POST /room/enterRoom/{roomId}  进入房间
- (id)initRoomEnterRoomWithParameter:(NSDictionary *)parameter{
    self = [super init];
    if (self) {
        _type = RoomApiType_EnterRoom;
        _parameter = parameter;
        
    }
    return self;
}

- (id)initRoomRoomConfWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId
{
    self = [super init];
    if (self) {
        _type = RoomApiType_RoomConf;
        _parameter = parameter;
        _parameterId =parameterId;
    }
    return self;
}


//POST ​/room​/{roomId}​/connectorList 房间连麦和排麦列表
- (id)initRoomConnectorListWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId {
    self = [super init];
    if (self) {
        _type = RoomApiType_Room_ConnectorList;
        _parameter = parameter;
        _parameterId =parameterId;
    }
    return self;
}

//POST ​​/room​/{roomId}​/crossRoomConnectorList 跨房连麦列表
- (id)initCrossRoomConnectorListWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId {
    self = [super init];
    if (self) {
        _type = RoomApiType_CrossRoom_ConnectorList;
        _parameter = parameter;
        _parameterId =parameterId;
    }
    return self;
}

//语音识别 临时授权 /tencent/asrSts
- (id)initTencentAsrStsWithParameter:(NSDictionary *)parameter {
    self = [super init];
    if (self) {
        _type = RoomApiType_TencentAsrSts;
        _parameter = parameter;
    }
    return self;
}


- (id)requestArgument
{
    return _parameter;
}

- (Class)modelClass
{

    return [BSModel class];
}

- (NSString *)parameterId
{
    if (!_parameterId.length) {
        return @"";
    }
    return _parameterId;
}

- (NSString *)requestUrl
{
    switch (_type) {
        case RoomApiType_Room_Create:
        {
            NSString *url = @"/room/create";
            return url;
        }
            break;
        case RoomApiType_Room_List:
        {
            NSString *url = @"/room/list";
            return url;
        }
            break;
        case RoomApiType_Room_BackGround:
        {
            NSString *url = @"/room/backgroundGoodsList";
            return url;
        }
            break;
        case RoomApiType_RoomHall_WebSocket:
        {
            NSString *url = @"/room/hallWebSocket";
            
            return url;
        }
            break;
        case RoomApiType_Room_BatchQueryRoom: //批量查询房间信息
        {
            NSString *url = @"/room/batchQueryRoom";
            
            return url;
        }
            break;
        case RoomApiType_EnterRoom://进入房间
        {
            NSString *url = @"/room/enterRoom";
            
            return url;
        }
            break;
        case RoomApiType_RoomConf:
        {
          NSString *url = @"/room/roomConf/{roomId}";
          url = [url stringByReplacingOccurrencesOfString:@"{roomId}" withString:self.parameterId];

          return url;
        }
        break;
        case RoomApiType_Room_ConnectorList:
        {
          NSString *url = @"/room/{roomId}/connectorList";
          url = [url stringByReplacingOccurrencesOfString:@"{roomId}" withString:self.parameterId];

          return url;
        }
        break;
        case RoomApiType_CrossRoom_ConnectorList:
        {
          NSString *url = @"/room/{roomId}/crossRoomConnectorList";
          url = [url stringByReplacingOccurrencesOfString:@"{roomId}" withString:self.parameterId];

          return url;
        }
        break;
        case RoomApiType_TencentAsrSts:
        {
          NSString *url = @"/tencent/asrSts";
          return url;
        }
        break;
        case RoomApiType_RoomConfig:
        {
          NSString *url = @"/room/{roomId}/config";
            url = [url stringByReplacingOccurrencesOfString:@"{roomId}" withString:self.parameterId];
          return url;
        }
        break;
            
        case RoomUserAssetRoomCardStatus:
        {
          NSString *url = @"/room/{roomId}/userAsset/roomCard/status";
            url = [url stringByReplacingOccurrencesOfString:@"{roomId}" withString:self.parameterId];
          return url;
        }
        break;
            
        case RoomUserAssetRoomCardStatus_:
        {
          NSString *url = @"/room/userAsset/roomCard/status";
          return url;
        }
        break;
        case RoomDurationRenewBefore:
        {
          NSString *url = @"/room/{roomId}/durationRenewBefore";
          url = [url stringByReplacingOccurrencesOfString:@"{roomId}" withString:self.parameterId];
          return url;
        }
        break;
        case RoomDurationRenew:
        {
          NSString *url = @"/room/{roomId}/durationRenew";
          url = [url stringByReplacingOccurrencesOfString:@"{roomId}" withString:self.parameterId];
          return url;
         
        }
        break;
        case RoomApiType_roomInfo:
        {
          NSString *url = @"/room/{roomId}/roomInfo";
          url = [url stringByReplacingOccurrencesOfString:@"{roomId}" withString:self.parameterId];
          return url;
         
        }
        break;
        case RoomApiType_roomApply:
        {
          NSString *url = @"/room/roomApply";
          return url;
         
        }
        
        break;
            
        case RoomApiType_roomProfile:
        {
          NSString *url = @"/room/roomProfile/{roomId}";
            url = [url stringByReplacingOccurrencesOfString:@"{roomId}" withString:self.parameterId];
            return url;
         
        }
            break;
        case RoomApiType_Room_Tag_List:
        {
          NSString *url = @"/room/tag/list";
            return url;
         
        }
            break;
            
        case ThemeCornerList:
        {
          NSString *url = @"/themeCorner/list";
          return url;
         
        }
        
        break;
            
        case ThemeCornerInfo:
        {
          NSString *url = @"/themeCorner/{id}/info";
            url = [url stringByReplacingOccurrencesOfString:@"{id}" withString:self.parameterId];
            return url;
         
        }
            break;
        case PairRoomConfig:
        {
          NSString *url = @"/pairRoom/{roomId}/config";
          url = [url stringByReplacingOccurrencesOfString:@"{roomId}" withString:self.parameterId];
          return url;
         
        }
            break;
        case ThemeCornerUserApply:
        {
          NSString *url = @"/themeCorner/userApply";
          return url;
         
        }
            break;
        case ThemeCornerCheckOrBuyLimit:
        {
          NSString *url = @"/themeCorner/checkOrBuyLimit";
          return url;
         
        }
            break;
        case PairRoomCloseResult:
        {
          NSString *url = @"/pairRoom/{roomId}/closeResult";
          url = [url stringByReplacingOccurrencesOfString:@"{roomId}" withString:self.parameterId];
          return url;
         
        }
            break;
            
        case PairRoomVote:
        {
          NSString *url = @"/pairRoom/{roomId}/vote";
          url = [url stringByReplacingOccurrencesOfString:@"{roomId}" withString:self.parameterId];
          return url;
         
        }
            break;
        case RoomCloseResult:
        {
          NSString *url = @"/room/{roomId}/closeResult";
          url = [url stringByReplacingOccurrencesOfString:@"{roomId}" withString:self.parameterId];
          return url;
         
        }
            break;
            
            
        default:
        {
            return @"";
        }
            break;
    }
}



@end
