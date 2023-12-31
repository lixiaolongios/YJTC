//
//  AppDelegate.m
//  YJTC
//
//  Created by 李小龙 on 2023/12/30.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window =[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    

    if (![UserManagerInstance user_isLogin]) {
         self.tabC.viewControllers =nil;
        LoginViewController *controller = [[LoginViewController alloc] init];
        BSNavigationController *nv =[[BSNavigationController alloc] initWithRootViewController:controller];
        self.window.rootViewController = nv;
    }else{

        BSTabBarController *tab = [[BSTabBarController alloc] init];
        self.window.rootViewController = tab;
        
    }
    
    return YES;
}



@end
