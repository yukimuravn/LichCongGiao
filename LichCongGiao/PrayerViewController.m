//
//  PrayerViewController.m
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/11/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import "PrayerViewController.h"

@interface PrayerViewController ()

@end

@implementation PrayerViewController

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
    self.title = @"Kinh";
    [self.view setBackgroundColor:[UIColor brownColor]];
    
    //Set Up MenuButton
    SWRevealViewController *revealController = [self revealViewController];
    UIBarButtonItem *menu_btn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu-icon"] style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = menu_btn;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
