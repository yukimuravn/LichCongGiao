//
//  InfoViewController.m
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/11/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()
{
    NSMutableArray *infoArrayName;
    NSMutableArray *infoArrayImage;
}
@end

@implementation InfoViewController
@synthesize infoTableView = _infoTableView;

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
    
    infoArrayName = [NSMutableArray arrayWithObjects:@"Yukimura Imba", @"www.lichconggiao.com", @"facebook.com/yukimura.vn", @"@yukimura_vn", nil];
    infoArrayImage = [NSMutableArray arrayWithObjects:@"info-yukimura", @"info-www", @"info-fb", @"info-twitter", nil];
    
    self.title = @"Thông Tin";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //Set Up MenuButton
    SWRevealViewController *revealController = [self revealViewController];
    UIBarButtonItem *menu_btn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu-icon"] style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = menu_btn;
    
    if (!_infoTableView) {
        self.infoTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 300, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        self.infoTableView.dataSource = self;
        self.infoTableView.delegate = self;
        [self.infoTableView setBackgroundColor:[UIColor clearColor]];
        [self.infoTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self.infoTableView setScrollEnabled:NO];
        [self.view addSubview:self.infoTableView];
    }
    
    UIImageView *infoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"info-church"]];
    [infoImageView setFrame:CGRectMake(59, 140, 202, 144)];
    [self.view addSubview:infoImageView];
    
    UILabel *infoName = [[UILabel alloc]initWithFrame:CGRectZero];
    [infoName setText:@"Lịch Công Giáo"];
    [infoName setFont:[UIFont boldSystemFontOfSize:24]];
    [infoName setTextColor:[UIColor grayColor]];
    [infoName sizeToFit];
    infoName.center = infoImageView.center;
    CGRect frame = infoName.frame;
    frame.origin.y += 90;
    infoName.frame = frame;
    [self.view addSubview:infoName];
    
    UILabel *infoVersion = [[UILabel alloc]initWithFrame:CGRectZero];
    [infoVersion setText:@"Version 1.0"];
    [infoVersion setTextColor:[UIColor grayColor]];
    [infoVersion sizeToFit];
    infoVersion.center = infoName.center;
    CGRect verFrame = infoVersion.frame;
    verFrame.origin.y += 22;
    infoVersion.frame = verFrame;
    [self.view addSubview:infoVersion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"infoCell";

    InfoCell *cell = (InfoCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"InfoCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.label.text = [infoArrayName objectAtIndex:indexPath.row];
    cell.label.textColor = [UIColor grayColor];
    cell.imageView.image = [UIImage imageNamed:[infoArrayImage objectAtIndex:indexPath.row]];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        [theTableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end