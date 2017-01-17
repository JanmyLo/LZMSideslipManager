//
//  AppDelegate.m
//  LZMSideslipController
//
//  Created by Janmy on 17/1/17.
//  Copyright © 2017年 Janmy. All rights reserved.
//

#import "AppDelegate.h"
#import "LZMMainViewController.h"
#import "LZMLeftViewController.h"
#import "LZMRightViewController.h"
#import "LZMSideslipViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //设置左右视图宽度缩放比例
    CGFloat scale = 0.75;
    
    
    LZMMainViewController *mainVC = [[LZMMainViewController alloc]init];
    LZMLeftViewController *leftVC = [[LZMLeftViewController alloc]init];
    LZMRightViewController *rightVC = [[LZMRightViewController alloc]init];
    
    
    LZMSideslipViewController *slipVC = [[LZMSideslipViewController alloc]initWithLeftVC:leftVC MainVC:mainVC rightVC:rightVC andScale:scale];
    //可根据实际需求是否关闭某个侧滑页面。
    //slipVC.allowRightSideslip = NO;
    //slipVC.allowLeftSideslip = NO;
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = slipVC;
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
