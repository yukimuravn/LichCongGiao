//
//  MusicInfoViewController.m
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/15/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import "MusicInfoViewController.h"

@interface MusicInfoViewController ()

@end

@implementation MusicInfoViewController

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
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = NO;
    revealController.tapGestureRecognizer.enabled = NO;
    revealController = nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = YES;
    revealController.tapGestureRecognizer.enabled = YES;
    revealController = nil;
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
