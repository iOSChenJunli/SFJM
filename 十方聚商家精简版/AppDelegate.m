//
//  AppDelegate.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/7.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    UITabBarController * tabBarC;
}

@end

@implementation AppDelegate
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (![[RequestSingleInstance shareRequestInstanse] token]) {
        //        RequestSingleInstance * instance = [RequestSingleInstance shareRequestInstanse];
        //        instance.userID = @"45";
        //        instance.token = [BasicMerhod returnTokenWithUserID:@"45"];
//        [self.window.rootViewController presentViewController:[[UIStoryboard storyboardWithName:@"LoginStoryboard" bundle:nil]instantiateViewControllerWithIdentifier:@"LoginViewControllerNav"] animated:YES completion:nil];
    }
    
    
    if (viewController == [[tabBarController viewControllers] objectAtIndex:0])
    {
//       [[NSUserDefaults standardUserDefaults] setObject:@(NO) forKey:@"BarHiddenAnimate"];
    }
    
    if (viewController == [[tabBarController viewControllers] objectAtIndex:4])
    {
        
        //控制界面跳转时的黑影问题（主界面导航栏隐藏，子界面不隐藏的问题）
        [[NSUserDefaults standardUserDefaults] setObject:@(NO) forKey:@"BarHiddenAnimate"];
 
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //键盘自适应
    //[IQKeyboardManager sharedManager];
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
    
    [BasicMerhod initGlobalValue];
    tabBarC = (UITabBarController*)self.window.rootViewController;
    
    tabBarC.delegate=self;
    
    for(int i = 0; i < tabBarC.viewControllers.count; i++)
    {
        UITabBarItem *item;
        
        if(i == 0)
        {
            item = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"tab_home_normal@2x"] selectedImage:[[UIImage imageNamed:@"tab_home_click@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        }
        else if (i == 1)
        {
            item = [[UITabBarItem alloc]initWithTitle:@"订单" image:[UIImage imageNamed:@"tab_product_normal"] selectedImage:[[UIImage imageNamed:@"tab_product_click"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        }
        else if (i == 2)
        {
            item = [[UITabBarItem alloc]initWithTitle:@"验证" image:[UIImage imageNamed:@"tab_account_normal"] selectedImage:[[UIImage imageNamed:@"tab_account_click"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        }
        else if (i == 3)
        {
            item = [[UITabBarItem alloc]initWithTitle:@"客服" image:[UIImage imageNamed:@"tab_more_normal"] selectedImage:[[UIImage imageNamed:@"tab_more_click"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        }else{
           item = [[UITabBarItem alloc]initWithTitle:@"账户" image:[UIImage imageNamed:@"tab_more_normal"] selectedImage:[[UIImage imageNamed:@"tab_more_click"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        }
        
        //文字颜色
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                      [BasicMerhod colorWithHexString:@"#7b8b95"], NSForegroundColorAttributeName,
                                      nil] forState:UIControlStateNormal];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                      [BasicMerhod colorWithHexString:@"#fc7226"], NSForegroundColorAttributeName,
                                      nil] forState:UIControlStateSelected];
        
        [[tabBarC.viewControllers objectAtIndex:i] setTabBarItem:item];
    }
    
    tabBarC.selectedIndex=0;
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
