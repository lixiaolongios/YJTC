//
//  SystemMacro.h
//  reward
//
//  Created by apple on 2018/9/8.
//  Copyright © 2018年 reward. All rights reserved.
//

#ifndef SystemMacro_h
#define SystemMacro_h

#define log_level 0//0不打印日志 1打印log日志 2打印 socket日志 3打印全部日志

//****************************** 系统 ***************************** //
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define iOS13 (SYSTEM_VERSION >= 13.0)?YES:NO
#define iOS12 (SYSTEM_VERSION >= 12.0)?YES:NO
#define iOS11 (SYSTEM_VERSION >= 11.0)?YES:NO
#define iOS10 (SYSTEM_VERSION >= 10.0)?YES:NO
#define iOS9 (SYSTEM_VERSION >= 9.0)?YES:NO
#define iOS8 (SYSTEM_VERSION >= 8.0)?YES:NO
#define iOS7 (SYSTEM_VERSION >= 7.0)?YES:NO
#define iOS6 (SYSTEM_VERSION >= 6.0)?YES:NO

//****************************** 设备类型 ***************************** //
#define iPhoneX   ((KSCREEN_HEIGHT>=812)?YES:NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iTouch ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ((KSCREEN_WIDTH==414)?YES:NO)
#define iPhone6   ((KSCREEN_WIDTH==375)?YES:NO)
#define iPhone320 ((KSCREEN_WIDTH==320)?YES:NO)
#define iPhone4 ((KSCREEN_HEIGHT==480)?YES:NO)


//****************************** 屏幕 ***************************** //
// 尺寸适配
#define KSCREEN_ADAPTER(w) lrintf(1.0*KSCREEN_WIDTH/375.0f*(w))
//屏幕宽度
#define KSCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
// 屏幕高
#define KSCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
// 比例
#define KSCREEN_SCALE      ([UIScreen mainScreen].scale)
//适配（以iPhone6为基准传入高，得出当前设备应该有的高度）
#define KSCALEHeight(height)  ((height) *KSCREEN_WIDTH/375.0f)
#define KSCALEWidth(width) ((width) *KSCREEN_WIDTH/375.0f)

// 缩放比
#define kScale ([UIScreen mainScreen].bounds.size.width) / 375

#define hScale ([UIScreen mainScreen].bounds.size.height) / 667

// 宽高适配
#define WIDTH_ADAPTER(w) lrintf(1.0*JA_SCREEN_WIDTH/375.0f*(w))
#define HEIGHT_ADAPTER(h) lrintf(1.0*JA_SCREEN_HEIGHT/375.0f*(h))

// 屏幕宽
#define JA_SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
// 屏幕高
#define JA_SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

// 状态栏

#define STATUSBAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height  // 状态栏高度

// Status bar height.
#define  StatusBarHeight      (iPhoneX ? 44.f : 20.f)

// 适配 iPhone X
#define  StatusBarLightHeight      (iPhoneX ? 44.f : 0.f)

// Navigation bar height.
#define  NavigationBarHeight  44.f
// Tabbar height.
#define  KTabbarHeight         (iPhoneX ? (49.f+34.f) : 49.f)
// Tabbar safe bottom margin.
#define  TabbarSafeBottomMargin         (iPhoneX ? 34.f : 0.f)
// Status bar & navigation bar height.
#define  StatusBarAndNavigationBarHeight  (iPhoneX ? 88.f : 64.f)

#define iOS_X_NAV_HEIGHT(x) (iPhoneX ? ((x) + 24) : (x))
#define iOS_X_BOTTOM_BAR_HEIGHT(x) (iPhoneX ? ((x) + 34) : (x))

#define iOS11StatusBarHeight    ((iOS11)?(StatusBarAndNavigationBarHeight):0)

// 常用宏
#define AppDelegateWindow [UIApplication sharedApplication].delegate.window

#define   Defaults [NSUserDefaults standardUserDefaults]

#define USER_ID   @"5";

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


/** weakSelf */
#define OC_WeakSelf typeof(self) __weak weakSelf = self;

/** keyWindow */
#define OC_KeyWindow [UIApplication sharedApplication].keyWindow

/** 当前控制器 */
#define OC_CurrentViewControl [[GlobalManager shareGlobalManager] global_currentViewControl]

#define OC_CurrentNavigationViewControl [[GlobalManager shareGlobalManager] global_currentNavigationViewControl]

/** 加载本地图片 */
#define ImageForName(imageName) [UIImage imageNamed:imageName]

#define OC_Bounds [UIScreen mainScreen].bounds

#define KPageNum   1
#define KPageSize   20

#define KAnchorBgHeight ((10+70+11+3+18) * 3.0 + 4 * 4.0)

/** UITableView 注册 */
#define UITableViewRegisterNibCell(tableView,class) [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(class) bundle:nil] forCellReuseIdentifier:NSStringFromClass(class)]

#define UITableViewRegisterNibHeader(tableView,class)  [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(class) bundle:nil] forHeaderFooterViewReuseIdentifier:NSStringFromClass(class)]

/** UICollectionView 注册 */
#define UICollectionRegisterNibCell(collectionView,class) [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(class) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(class)]

#define UICollectionRegisterNibHeader(collectionView,class)  [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(class) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(class)]

#define UICollectionRegisterNibFooter(collectionView,class)  [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(class) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(class)]

#define BeginIgnoreDeprecatedWarning _Pragma("clang diagnostic push") _Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"")
#define EndIgnoreDeprecatedWarning _Pragma("clang diagnostic pop")





#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif /* SystemMacro_h */
