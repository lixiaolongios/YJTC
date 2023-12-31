//
//  BSTabBarController.m
//  AC
//
//  Created by xujin on 2018/11/15.
//  Copyright © 2018年 Moli. All rights reserved.
//

#import "BSTabBarController.h"
#import "BSNavigationController.h"


@interface BSTabBarController ()

@end

@implementation BSTabBarController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController];
    
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance * appearance = [UITabBarAppearance new];
        UITabBarItemAppearance *inlineLayoutAppearance = [[UITabBarItemAppearance alloc] init];
        [ inlineLayoutAppearance.normal setTitleTextAttributes:@{NSFontAttributeName:REGULAR_FONT(10), NSForegroundColorAttributeName:c_ffffff}];
        [ inlineLayoutAppearance.selected setTitleTextAttributes:@{NSFontAttributeName:REGULAR_FONT(10), NSForegroundColorAttributeName:c_ffffff}];
        appearance.stackedLayoutAppearance = inlineLayoutAppearance;
        
        if (@available(iOS 15.0, *)) {
            appearance.backgroundColor = MAIN_COLOR;
            //appearance.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabBar_bg"]];
            self.tabBar.scrollEdgeAppearance = appearance;
            
        }
        
        self.tabBar.standardAppearance = appearance;
        
        
    }
    else {
        // Override point for customization after application launch.
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:REGULAR_FONT(10), NSForegroundColorAttributeName:c_ffffff} forState:UIControlStateNormal];
        // 选中状态的标题颜色
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:REGULAR_FONT(10), NSForegroundColorAttributeName:c_ffffff} forState:UIControlStateSelected];
        
    }
   
    
}




- (void)addChildViewController {
    NSArray *classNameArr = @[@"HomeViewController",@"MineViewController"];

    NSArray *titleArr = @[@"首页",@"我的"];
    NSArray *imageArr = @[@"tabBar_home_",@"tabBar_mine_"];

    for (NSInteger i = 0; i < classNameArr.count; i++) {

        NSString *imageD = nil;
        Class class = NSClassFromString(classNameArr[i]);
        imageD = [NSString stringWithFormat:@"%@d",imageArr[i]];
        [self addChildViewController:[class new] title:titleArr[i] image:imageD selectImage:[NSString stringWithFormat:@"%@s",imageArr[i]]];

    }
    
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectImage:(NSString  *)selectImage {
    
    childController.tabBarItem.title = title;
    [childController.tabBarItem setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    BSNavigationController *nav = [[BSNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:nav];
    
}


#if 0
#pragma mark- UITabBarDelegate
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSInteger index = [self.tabBar.items indexOfObject:item];
    [self animationWithIndex:index];

}

- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    [self tabBarButtonClick:tabbarbuttonArray[index]];
    
}
#endif

#if 0
//TODO:点击动画
-(void)tabBarButtonClick:(UIControl *)tabbarButton {
    
//    for (UIView *imageView in tabbarButton.subviews) {
//        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
//            [imageView addScaleAnimationOnView];
//        }
//    }
}

- (void)tabBarDidClickPlusButton:(BaseTabBar *)tabBar {
//    UIView *plus =[tabBar valueForKey:@"plusButton"];
//    [plus addScaleAnimationOnView];
//
//    [PlusView showPlusView];
    
}
#endif





@end
