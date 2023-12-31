//
//  BaseView.m
//  HolaChat
//
//  Created by 徐天牧 on 2022/9/5.
//

#import "BaseView.h"
#import "XibViewUtils.h"
#import "SectionAdapterModel.h"
//#import "BaseNavBarView.h"

@implementation BaseView
+ (id)loadFromXib {
    return [XibViewUtils loadViewFromXibNamed:NSStringFromClass([self class])];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
       
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)initRefreshData {
    self.pageNum = KPageNum;
    self.pageSize = KPageSize;
  //  self.refreshType = UIBehaviorTypeStyle_Normal;
}

- (void)layoutUI {
    //self.backgroundColor = MAIN_COLOR;
}


- (void)upAnimation {
    OC_WeakSelf
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.bottom = weakSelf.height;
    }];
}

- (void)downAnimation {
    OC_WeakSelf
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.top = weakSelf.height;
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];

}


- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableArray *)secDataArray {
    if (!_secDataArray) {
        _secDataArray = [NSMutableArray array];
    }
    return _secDataArray;
}


- (NSMutableArray *)sectionArr {
    if (!_sectionArr) {
        _sectionArr = [NSMutableArray array];
    }
    return _sectionArr;
}



- (void)addSectionModel:(SectionAdapterModel *)sectionModel {
    SectionAdapterModel *sM = [self filterSectionModelByType:sectionModel.sectionType];
    if (sM) {
        [self.sectionArr removeObject:sM];
    }
    if(sectionModel != nil){
        [self.sectionArr addObject:sectionModel];
        NSSortDescriptor *sortType = [NSSortDescriptor sortDescriptorWithKey:@"sectionType" ascending:YES];
        NSArray *sortAry = [self.sectionArr sortedArrayUsingDescriptors:@[sortType]];
        self.sectionArr = [NSMutableArray arrayWithArray:sortAry];
    }
}

- (SectionAdapterModel *)filterSectionModelByType:(SectionType)type {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"sectionType==%d",type];
    NSArray *filters = [self.sectionArr filteredArrayUsingPredicate:pre];
    if (filters.count) {
        return [filters firstObject];
    }
    return nil;
}


- (void)refresh {
    self.pageNum =KPageNum;
  //  self.refreshType =UIBehaviorTypeStyle_Refresh;
    
};

- (void)loadMore {
    self.pageNum++;
  //  self.refreshType =UIBehaviorTypeStyle_More;
   
}




/*
  研究物理关系和逻辑关系
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
