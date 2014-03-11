//
//  HomeAppDelegate.h
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/10/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "DateViewController.h"
#import "MenuViewController.h"

@class SWRevealViewController;

@interface HomeAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SWRevealViewController *viewController;

@end
