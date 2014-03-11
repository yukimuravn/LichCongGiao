//
//  MenuViewController.h
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/11/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuCell.h"
#import "SWRevealViewController.h"
#import "DateViewController.h"
#import "MonthViewController.h"
#import "SaintViewController.h"
#import "PrayerViewController.h"
#import "MusicViewController.h"
#import "SettingViewController.h"
#import "InfoViewController.h"

@interface MenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *menuTableView;

@end
