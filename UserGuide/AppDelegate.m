//
//  AppDelegate.m
//  UserGuide
//
//  Created by cloay on 13-3-18.
//  Copyright (c) 2013年 Cloay. All rights reserved.
//

#import "AppDelegate.h"
#import "GuideView.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self showGuideView];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)showGuideView{
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"HaveLaunched"]) {//是首次
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HaveLaunched"];
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
        GuideView *guideView = [[[UINib nibWithNibName:@"GuideView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        float height = DEVICE_IS_IPHONE5 ? 568 : 480;
        [guideView setFrame:CGRectMake(0, 0, 320, height)];
        
        [guideView setBackgroundColor:[UIColor clearColor]];
        [self.window.rootViewController.view addSubview:guideView];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
