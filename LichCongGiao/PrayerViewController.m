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
@synthesize prayerTableView = _prayerTableView;

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
    UIImage *menuIcon = [UIImage imageNamed:@"menu-icon"];
    UIButton *menuBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, menuIcon.size.width, menuIcon.size.height)];
    [menuBtn setBackgroundImage:menuIcon forState:UIControlStateNormal];
    [menuBtn setShowsTouchWhenHighlighted:YES];
    [menuBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menu_btn = [[UIBarButtonItem alloc]initWithCustomView:menuBtn];
    self.navigationItem.leftBarButtonItem = menu_btn;
    
    //Set Up UITableView
    CGSize size = [[UIScreen mainScreen] bounds].size;
    if (!_prayerTableView) {
        self.prayerTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height) style:UITableViewStylePlain];
        self.prayerTableView.dataSource = self;
        self.prayerTableView.delegate = self;
        [self.view addSubview:self.prayerTableView];
    }

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
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"prayerCell";
    
    // Default UITableViewCell
    UITableViewCell *cell = (UITableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
     }
    cell.textLabel.text = [NSString stringWithFormat:@"Kinh 0%i",indexPath.row];
    cell.detailTextLabel.text = @"ABC";
//    
//    MenuCell *cell = (MenuCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (cell == nil)
//    {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
//    }
//    
//    cell.label.text = [menuArrayName objectAtIndex:indexPath.row];
//    cell.label.textColor = [UIColor whiteColor];
//    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"menu-cell-0%li",(long)indexPath.row]];
//    cell.backgroundColor = [UIColor clearColor];
//    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    return cell;
}

// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [theTableView cellForRowAtIndexPath:indexPath];
    NSString *cellTitle = selectedCell.textLabel.text;
    
    PrayerInfoViewController *prayerInfoVC = [[PrayerInfoViewController alloc]initWithNibName:@"PrayerInfoViewController" bundle:nil];
    prayerInfoVC.title = cellTitle;
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Trở Lại" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    [self.navigationController pushViewController:prayerInfoVC animated:YES];
    [theTableView deselectRowAtIndexPath:indexPath animated:NO];
}


@end
