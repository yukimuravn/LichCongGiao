//
//  SettingViewController.m
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/11/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Cài Đặt";
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    //Set Up MenuButton
    SWRevealViewController *revealController = [self revealViewController];
    UIImage *menuIcon = [UIImage imageNamed:@"menu-icon"];
    UIButton *menuBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, menuIcon.size.width, menuIcon.size.height)];
    [menuBtn setBackgroundImage:menuIcon forState:UIControlStateNormal];
    [menuBtn setShowsTouchWhenHighlighted:YES];
    [menuBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menu_btn = [[UIBarButtonItem alloc]initWithCustomView:menuBtn];
    self.navigationItem.leftBarButtonItem = menu_btn;
    
    //Set Up SearchButton
    UIImage *searchIcon = [UIImage imageNamed:@"search-icon"];
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, searchIcon.size.width, searchIcon.size.height)];
    [searchBtn setBackgroundImage:searchIcon forState:UIControlStateNormal];
    [searchBtn setShowsTouchWhenHighlighted:YES];
    [searchBtn addTarget:self action:@selector(pushCoreDateVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *search_btn = [[UIBarButtonItem alloc]initWithCustomView:searchBtn];
    self.navigationItem.rightBarButtonItem = search_btn;

}

- (void)pushCoreDateVC
{
    CoreDataViewController *coreDataVC = [[CoreDataViewController alloc]initWithNibName:@"CoreDataViewController" bundle:nil];
    [self.navigationController pushViewController:coreDataVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
