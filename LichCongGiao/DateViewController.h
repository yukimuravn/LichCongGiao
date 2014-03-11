//
//  DateViewController.h
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/11/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageViewController.h"
#import "MenuViewController.h"
#import "SWRevealViewController.h"

@interface DateViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) UIPageViewController *datePageVC;
@property (nonatomic, strong) UIPageControl *datePageControl;

@end
