//
//  SaintInfoViewController.m
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/13/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import "SaintInfoViewController.h"

@interface SaintInfoViewController ()
{
    UIScrollView *scrollView;
    UIImageView *saintImageView;
    UITextView *saintTextView;
    UILabel *saintLabelName;
    UILabel *saintLabelFeastDay;
}

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
    if (IS_IOS_7){
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.title = _saintName;
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    CGSize size = [[UIScreen mainScreen] bounds].size;
    
    //Set Up ScrollView
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height-64)];
//    [scrollView setBackgroundColor:[UIColor magentaColor]];
    [scrollView setContentSize:size];
    scrollView.showsVerticalScrollIndicator = YES;
    [self.view addSubview:scrollView];
    
    //Set Up SaintImageView
    UIImage *img = [UIImage imageNamed:@"img0"];
    UIImage *resizedImg = [UIImage imageWithImage:img scaledToSize:CGSizeMake(80, 80)];
    UIImage *round_img = [ImageManipulator makeRoundCornerImage:resizedImg :resizedImg.size.width/2 :resizedImg.size.height/2];
    saintImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, resizedImg.size.width, resizedImg.size.height)];
    [saintImageView setImage:round_img];
    [scrollView addSubview:saintImageView];
    
    //Set Up SaintLabel
    NSString *saintName = @"Thánh Martin de Porres";
    saintLabelName = [[UILabel alloc]initWithFrame:CGRectMake(120, 20, 100, 20)];
    [saintLabelName setText:saintName];
    [saintLabelName setBackgroundColor:[UIColor clearColor]];
    [saintLabelName sizeToFit];
    [scrollView addSubview:saintLabelName];
    
    NSString *saintFeastDay = @"Ngày lễ: 03-11";
    saintLabelFeastDay = [[UILabel alloc]initWithFrame:CGRectMake(120, 45, 100, 20)];
    [saintLabelFeastDay setText:saintFeastDay];
    [saintLabelFeastDay setBackgroundColor:[UIColor clearColor]];
    [saintLabelFeastDay sizeToFit];
    [scrollView addSubview:saintLabelFeastDay];
    
    //Set Up SaintTextView
    NSString *saintInfoText = @"St. Martin de Porres was born at Lima, Peru, in 1579. His father was a Spanish gentleman and his mother a coloured freed-woman from Panama. At fifteen, he became a lay brother at the Dominican Friary at Lima and spent his whole life there-as a barber, farm laborer, almoner, and infirmarian among other things.\nMartin had a great desire to go off to some foreign mission and thus earn the palm of martyrdom. However, since this was not possible, he made a martyr out of his body, devoting himself to ceaseless and severe penances. In turn, God endowed him with many graces and wondrous gifts, such as, aerial flights and bilocation.\nSt. Martin's love was all-embracing, shown equally to humans and to animals, including vermin, and he maintained a cats and dogs hospital at his sister's house. He also possessed spiritual wisdom, demonstrated in his solving his sister's marriage problems, raising a dowry for his niece inside of three day's time, and resolving theological problems for the learned of his Order and for bishops. A close friend of St. Rose of Lima, this saintly man died on November 3, 1639 and was canonized on May 6, 1962. His feast day is November 3.";
    saintTextView = [[UITextView alloc]initWithFrame:CGRectMake(20, 120, 280, 80)];
    [saintTextView setFont:[UIFont systemFontOfSize:15.0f]];
    [saintTextView setText:saintInfoText];
    [saintTextView setBackgroundColor:[UIColor clearColor]];
    [saintTextView setEditable:NO];
    [scrollView addSubview:saintTextView];
    CGFloat height = [UITextView measureHeightOfUITextView:saintTextView];
    CGRect saintTextViewFrame = saintTextView.frame;
    saintTextViewFrame.size.height = height;
    saintTextView.frame = saintTextViewFrame;
    
    
    //Reset ScrollView
    
    if ((height + 120) > size.height ) {
        CGSize scrollContentSize = scrollView.contentSize;
        scrollContentSize.height = height + 120;
        scrollView.contentSize = scrollContentSize;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = NO;
    revealController = nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = YES;
    revealController = nil;
    [super viewWillDisappear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
