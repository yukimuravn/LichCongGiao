//
//  SaintInfoViewController.m
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/13/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import "SaintInfoViewController.h"

@interface SaintInfoViewController ()

@end

@implementation SaintInfoViewController
@synthesize saintName = _saintName;

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
    self.title = _saintName;
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
