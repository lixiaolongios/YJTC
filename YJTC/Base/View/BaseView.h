//
//  BaseView.h
//  HolaChat
//
//  Created by 徐天牧 on 2022/9/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SectionAdapterModel;
@interface BaseView : UIView
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *secDataArray;
@property (nonatomic, strong) NSMutableArray *sectionArr;
//@property (nonatomic, assign) UIBehaviorTypeStyle refreshType;

+ (id)loadFromXib;
- (void)upAnimation;
- (void)downAnimation;

- (void)addSectionModel:(SectionAdapterModel *)sectionModel;
- (SectionAdapterModel *)filterSectionModelByType:(SectionType)type;

- (void)refresh;
- (void)loadMore;

- (void)initRefreshData;

@end

NS_ASSUME_NONNULL_END
