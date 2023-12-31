//
//  SectionAdapterModel.h
//  HolaChat
//
//  Created by 徐天牧 on 2022/9/9.
//

#import "BSModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SectionAdapterModel : BSModel
@property (nonatomic, assign) SectionType sectionType;
@property (nonatomic, copy) NSString *sectionName;
@property (nonatomic, strong) NSMutableArray *adapterArr;
@property (nonatomic, assign) CGFloat sectionHeight;

@end

NS_ASSUME_NONNULL_END
