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
    FBProfilePictureView *fbProfilePictureView;
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
    if (IS_IOS_7){
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //Set Up MenuButton
    SWRevealViewController *revealController = [self revealViewController];
    UIImage *menuIcon = [UIImage imageNamed:@"menu-icon"];
    UIButton *menuBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, menuIcon.size.width, menuIcon.size.height)];
    [menuBtn setBackgroundImage:menuIcon forState:UIControlStateNormal];
    [menuBtn setShowsTouchWhenHighlighted:YES];
    [menuBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menu_btn = [[UIBarButtonItem alloc]initWithCustomView:menuBtn];
    self.navigationItem.leftBarButtonItem = menu_btn;
    
    CGSize size = [[UIScreen mainScreen] bounds].size;
    NSLog(@"%@",NSStringFromCGSize(size));
    if (!_infoTableView) {
        self.infoTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, size.height-[infoArrayName count]*48 - 64, size.width, [infoArrayImage count]*48) style:UITableViewStylePlain];
        self.infoTableView.dataSource = self;
        self.infoTableView.delegate = self;
        [self.infoTableView setBackgroundColor:[UIColor whiteColor]];
//        UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
//        [self.infoTableView setTableHeaderView:view];
//        [self.infoTableView setTableFooterView:view];
//        [self.infoTableView setSeparatorInset:UIEdgeInsetsZero];
        [self.infoTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self.infoTableView setScrollEnabled:NO];
        [self.view addSubview:self.infoTableView];
    }
    
    UIImageView *infoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"info-church"]];
    [infoImageView setFrame:CGRectMake(59, size.height/2 - 220, 202, 144)];
//    if (IS_IOS_6) {
//        [infoImageView setFrame:CGRectMake(59, size.height/2 - 220 - 64, 202, 144)];
//    }
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
    
    //Set Up FBLoginView
    FBLoginView *loginView = [[FBLoginView alloc] initWithReadPermissions:@[@"basic_info", @"email", @"user_likes"]];
    loginView.delegate = self;
    loginView.center = self.view.center;
    CGRect loginFrame = loginView.frame;
    loginFrame.origin.y = 10;
    loginView.frame = loginFrame;
    [self.view addSubview:loginView];
    
    fbProfilePictureView = [[FBProfilePictureView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [fbProfilePictureView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:fbProfilePictureView];
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
    cell.imgView.image = [UIImage imageNamed:[infoArrayImage objectAtIndex:indexPath.row]];
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

#pragma mark - FBLoginViewDelegate
// This method will be called when the user information has been fetched
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
  fbProfilePictureView.profileID = user.id;
//  self.nameLabel.text = user.name;
}

// Implement the loginViewShowingLoggedInUser: delegate method to modify your app's UI for a logged-in user experience
- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
//  self.statusLabel.text = @"You're logged in as";
}

// Implement the loginViewShowingLoggedOutUser: delegate method to modify your app's UI for a logged-out user experience
- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
  fbProfilePictureView.profileID = nil;
//  self.nameLabel.text = @"";
//  self.statusLabel.text= @"You're not logged in!";
}

// You need to override loginView:handleError in order to handle possible errors that can occur during login
- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
  NSString *alertMessage, *alertTitle;

  // If the user should perform an action outside of you app to recover,
  // the SDK will provide a message for the user, you just need to surface it.
  // This conveniently handles cases like Facebook password change or unverified Facebook accounts.
  if ([FBErrorUtility shouldNotifyUserForError:error]) {
    alertTitle = @"Facebook error";
    alertMessage = [FBErrorUtility userMessageForError:error];

  // This code will handle session closures since that happen outside of the app.
  // You can take a look at our error handling guide to know more about it
  // https://developers.facebook.com/docs/ios/errors
  } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
    alertTitle = @"Session Error";
    alertMessage = @"Your current session is no longer valid. Please log in again.";

    // If the user has cancelled a login, we will do nothing.
    // You can also choose to show the user a message if cancelling login will result in
    // the user not being able to complete a task they had initiated in your app
    // (like accessing FB-stored information or posting to Facebook)
  } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
    NSLog(@"user cancelled login");

    // For simplicity, this sample handles other errors with a generic message
    // You can checkout our error handling guide for more detailed information
    // https://developers.facebook.com/docs/ios/errors
  } else {
    alertTitle  = @"Something went wrong";
    alertMessage = @"Please try again later.";
    NSLog(@"Unexpected error:%@", error);
  }

  if (alertMessage) {
    [[[UIAlertView alloc] initWithTitle:alertTitle
                                message:alertMessage
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
  }
}


@end
