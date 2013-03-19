//
//  AppDelegate.h
//  UserGuide
//
//  Created by cloay on 13-3-18.
//  Copyright (c) 2013年 Cloay. All rights reserved.
//

#import <UIKit/UIKit.h>
#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568) 

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
