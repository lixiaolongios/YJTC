//
//  RoomApi.h
//  AC
//
//  Created by xujin on 2019/3/12.
//  Copyright © 2019年 Moli. All rights reserved.
//

#import "NetRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeRequest : NetRequest
//[0.9.92 add] 房间关闭结果 /room/{roomId}/closeResult  // roomId 匹配房的id
- (id)initRoomCloseResultWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId;

//[0.9.92 add] 匹配房 关闭结果 {{baseUrl}}/pairRoom/{roomId}/closeResult  // roomId 匹配房的id
- (id)initPairRoomCloseResultWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId;

//[0.9.92 add] 匹配房(结束) 点赞 /pairRoom/1/vote
- (id)initPairRoomVoteWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId;

///[0.9.92 add] 检查或购买匹配次数 /themeCorner/checkOrBuyLimit
- (id)initThemeCornerCheckOrBuyLimitWithParameter:(NSDictionary *)parameter;

///[0.9.92 add] 主题用户预约 /themeCorner/userApply
- (id)initThemeCornerUserApplyWithParameter:(NSDictionary *)parameter;

///themeCorner/list 主题列表
- (id)initThemeCornerListWithParameter:(NSDictionary *)parameter;
///
///
////themeCorner/{id}/info  主题详情
- (id)initThemeCornerInfoWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId;

////pairRoom/{roomId}/config    roomId: 匹配房id    匹配房配置
- (id)initPairRoomConfigWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId;

// /api/room/{roomId}/config 房间配置
- (id)initRoomConfigWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId;

//POST /room/create  创建房间
- (id)initRoomCreateWithParameter:(NSDictionary *)parameter;

//POST /room/list 房间列表
- (id)initRoomListWithParameter:(NSDictionary *)parameter;

//POST /room/tag/list 房间 标签列表
- (id)initRoomTagListWithParameter:(NSDictionary *)parameter;


//POST /room/backgroundGoodsList 房间背景商品列表
- (id)initRoomBackGroundGoodsListWithParameter:(NSDictionary *)parameter;

// POST /room/hallWebSocket  大厅websocket地址
- (id)initRoomHallWebSocketWithParameter:(NSDictionary *)parameter;

//POST /activity/list 活动列表
- (id)initRoomBatchQueryRoomWithParameter:(NSDictionary *)parameter;

//POST /room/enterRoom/{roomId}  进入房间
- (id)initRoomEnterRoomWithParameter:(NSDictionary *)parameter;

//POST /room/roomConf/{roomId} 查询房主功能列表
- (id)initRoomRoomConfWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId;

//POST ​/room​/{roomId}​/connectorList 房间连麦和排麦列表
- (id)initRoomConnectorListWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId;

//POST ​​/room​/{roomId}​/crossRoomConnectorList 跨房连麦列表
- (id)initCrossRoomConnectorListWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId;

//语音识别 临时授权 /tencent/asrSts  创建房间
- (id)initTencentAsrStsWithParameter:(NSDictionary *)parameter;

///api/room/{roomId}/userAsset/roomCard/status 房间创建前和进行中 用户房卡道具状态
- (id)initRoomUserAssetRoomCardStatusWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId;

////api/room/userAsset/roomCard/status 房间创建前和进行中 用户房卡道具状态
- (id)initRoomUserAssetRoomCardStatusWithParameter:(NSDictionary *)parameter;

////api/room/{roomId}/durationRenewBefore 房间续时前 房卡或钻石
- (id)initRoomDurationRenewBeforeWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId;


////​/api​/room​/{roomId}​/durationRenew 房间续时 房卡或钻石
- (id)initRoomDurationRenewWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId;

///room/{roomId}/roomInfo
- (id)initRoomInfoWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId;

///room/{roomId}/roomInfo       /room/roomProfile/{roomId}
- (id)initRoomProfileWithParameter:(NSDictionary *)parameter parameterId:(NSString *)parameterId;

///baseUrl}}/room/roomApply
- (id)initRoomApplyWithParameter:(NSDictionary *)parameter;


@end

NS_ASSUME_NONNULL_END
