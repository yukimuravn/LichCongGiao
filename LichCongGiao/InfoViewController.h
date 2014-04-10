//
//  InfoViewController.h
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/11/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "InfoCell.h"
#import "Define.h"
#import <FacebookSDK/FacebookSDK.h>

@interface InfoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, FBLoginViewDelegate>

@property (nonatomic, strong) UITableView *infoTableView;

@end
