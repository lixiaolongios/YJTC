//
//  XibViewUtils.m
//  CarUtopia
//
//  Created by 徐天牧 on 2022/9/5.
//

#import "XibViewUtils.h"

@implementation XibViewUtils

+ (id)loadViewFromXibNamed:(NSString *)xibName {
    return [[self class] loadViewFromXibNamed:xibName withFileOwner:self];
}

+ (id)loadViewFromXibNamed:(NSString *)xibName withFileOwner:(id)fileOwner {
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:xibName owner:fileOwner options:nil];
    if (array && [array count]>0) {
        return array[0];
    }
    return nil;
}

@end
