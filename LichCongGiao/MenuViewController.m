//
//  MenuViewController.m
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/11/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
{
    NSMutableArray *menuArrayName;
}

@end

@implementation MenuViewController
@synthesize menuTableView = _menuTableView;

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
    
    menuArrayName = [NSMutableArray arrayWithObjects:@"Ngày", @"Tháng", @"Thánh", @"Kinh", @"Hát", @"Cài Đặt", @"Thông Tin", nil];
    
//    [self.view setBackgroundColor:[UIColor colorWithRed:0.0f green:51/255.0f blue:102/255.0f alpha:1]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    if (!_menuTableView) {
        self.menuTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        self.menuTableView.dataSource = self;
        self.menuTableView.delegate = self;
        [self.menuTableView setBackgroundColor:[UIColor clearColor]];
        [self.menuTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self.view addSubview:self.menuTableView];
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
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"menuCell";
    
    // Default UITableViewCell
    /*UITableViewCell *cell = (UITableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Row 0%i",indexPath.row];*/
    
    MenuCell *cell = (MenuCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.label.text = [menuArrayName objectAtIndex:indexPath.row];
    cell.label.textColor = [UIColor grayColor];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"menu-cell-0%i",indexPath.row]];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWRevealViewController *revealController = self.revealViewController;
    
    UINavigationController *frontNavigationController = (id)revealController.frontViewController;
    NSInteger row = indexPath.row;
    
    switch (row) {
        case 0:
            if ( ![frontNavigationController.topViewController isKindOfClass:[DateViewController class]] )
            {
                DateViewController *frontViewController = [[DateViewController alloc] init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
                [revealController pushFrontViewController:navigationController animated:YES];
            }
            else
            {
                [revealController revealToggle:self];
            }
            break;
        case 1:
            if ( ![frontNavigationController.topViewController isKindOfClass:[MonthViewController class]] )
            {
                MonthViewController *frontViewController = [[MonthViewController alloc] init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
                [revealController pushFrontViewController:navigationController animated:YES];
            }
            else
            {
                [revealController revealToggle:self];
            }
            break;
        case 2:
            if ( ![frontNavigationController.topViewController isKindOfClass:[SaintViewController class]] )
            {
                SaintViewController *frontViewController = [[SaintViewController alloc] init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
                [revealController pushFrontViewController:navigationController animated:YES];
            }
            else
            {
                [revealController revealToggle:self];
            }
            break;
        case 3:
            if ( ![frontNavigationController.topViewController isKindOfClass:[PrayerViewController class]] )
            {
                PrayerViewController *frontViewController = [[PrayerViewController alloc] init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
                [revealController pushFrontViewController:navigationController animated:YES];
            }
            else
            {
                [revealController revealToggle:self];
            }
            break;
        case 4:
            if ( ![frontNavigationController.topViewController isKindOfClass:[MusicViewController class]] )
            {
                MusicViewController *frontViewController = [[MusicViewController alloc] init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
                [revealController pushFrontViewController:navigationController animated:YES];
            }
            else
            {
                [revealController revealToggle:self];
            }
            break;
        case 5:
            if ( ![frontNavigationController.topViewController isKindOfClass:[SettingViewController class]] )
            {
                SettingViewController *frontViewController = [[SettingViewController alloc] init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
                [revealController pushFrontViewController:navigationController animated:YES];
            }
            else
            {
                [revealController revealToggle:self];
            }
            break;
        case 6:
            if ( ![frontNavigationController.topViewController isKindOfClass:[InfoViewController class]] )
            {
                InfoViewController *frontViewController = [[InfoViewController alloc] init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
                [revealController pushFrontViewController:navigationController animated:YES];
            }
            else
            {
                [revealController revealToggle:self];
            }
            break;
        default:
            [revealController revealToggle:self];
            break;
    }
    
    [theTableView deselectRowAtIndexPath:indexPath animated:NO];
}


@end
