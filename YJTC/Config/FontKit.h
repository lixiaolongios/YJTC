//
//  FontKit.h
//  AC
//
//  Created by xujin on 2018/11/15.
//  Copyright © 2018年 Moli. All rights reserved.
//

#ifndef FontKit_h
#define FontKit_h
//字体
#define FONT(f)   [UIFont systemFontOfSize:(f)]
#define LIGHT_FONT(size) [UIFont systemFontOfSize:size fontWithName:@"PingFangSC-Light"]
#define REGULAR_FONT(size) [UIFont systemFontOfSize:size fontWithName:@"PingFangSC-Regular"]
#define MEDIUM_FONT(size) [UIFont systemFontOfSize:size fontWithName:@"PingFangSC-Medium"]
#define SEMIBOLD_FONT(size) [UIFont systemFontOfSize:size fontWithName:@"PingFangSC-Semibold"]
#define SourceHanSerifCNBold_FONT(size) [UIFont systemFontOfSize:size fontWithName:@"SourceHanSerifCN-Bold"]
#define SourceHanSerifCNHeavy_FONT(size) [UIFont systemFontOfSize:size fontWithName:@"SourceHanSansCN-Heavy"]
#define NanumGothic_ExtraBold_FONT(size) [UIFont systemFontOfSize:size fontWithName:@"Nanum Gothic-ExtraBold"]
#define NanumGothic_FONT(size) [UIFont systemFontOfSize:size fontWithName:@"NanumGothic-Regular"]
#define ArialBoldMT_FONT(size) [UIFont systemFontOfSize:size fontWithName:@"Arial-BoldMT"]
#define DINAlternateBold_FONT(size) [UIFont systemFontOfSize:size fontWithName:@"DINAlternate-Bold"]


//字体
#define JA_LIGHT_FONT(size) [UIFont ja_systemFontOfSize:size weight:UIFontWeightLight]
#define JA_REGULAR_FONT(size) [UIFont ja_systemFontOfSize:size weight:UIFontWeightRegular]
#define JA_MEDIUM_FONT(size) [UIFont ja_systemFontOfSize:size weight:UIFontWeightMedium]

#endif /* FontKit_h */
