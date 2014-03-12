//
//  DateViewController.m
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/11/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import "DateViewController.h"

@interface DateViewController ()
{
    NSMutableArray *pageVC_Array;
    ImageViewController *imgVC;
    BOOL isShowMenu;
}

@end

@implementation DateViewController
@synthesize datePageControl = _datePageControl;
@synthesize datePageVC = _datePageVC;

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
    
    //Set Up MenuButton
    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    UIImage *menuIcon = [UIImage imageNamed:@"menu-icon"];
    UIButton *menuBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, menuIcon.size.width, menuIcon.size.height)];
    [menuBtn setBackgroundImage:menuIcon forState:UIControlStateNormal];
    [menuBtn setShowsTouchWhenHighlighted:YES];
    [menuBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menu_btn = [[UIBarButtonItem alloc]initWithCustomView:menuBtn];
    self.navigationItem.leftBarButtonItem = menu_btn;
    
    // Do any additional setup after loading the view from its nib.
    self.title = @"Ngày";
    [self.view setBackgroundColor:[UIColor redColor]];
    isShowMenu = NO;
    if (IS_IOS_7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

    //Set Up DatePageViewController
    if (!self.datePageVC) {
        self.datePageVC = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        [self.datePageVC.view setBackgroundColor:[UIColor lightGrayColor]];
        [self.datePageVC.view setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        self.datePageVC.delegate = self;
        self.datePageVC.dataSource = self;
    }
    
    [self createPageControl];
    
    if (!imgVC) {
        imgVC = [self viewControllerAtIndex:0];
    }
    
    if (!pageVC_Array) {
        pageVC_Array = [[NSMutableArray alloc]initWithObjects:imgVC, nil];
    }
    
    [self.datePageVC setViewControllers:pageVC_Array direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self addChildViewController:self.datePageVC];
    [self.view addSubview:self.datePageVC.view];
    [self.datePageVC didMoveToParentViewController:self];
}

- (void)createPageControl
{
    self.datePageControl = [[UIPageControl alloc]init];
    [self.datePageControl setFrame:CGRectMake(self.datePageVC.view.bounds.size.width/2, self.datePageVC.view.bounds.size.height - 30, 0, 0)];
    [self.datePageControl setNumberOfPages:6];
    [self.datePageControl setCurrentPage:0];
    [self.datePageControl setCurrentPageIndicatorTintColor:[UIColor redColor]];
    [self.datePageControl setPageIndicatorTintColor:[UIColor whiteColor]];
//    [self.datePageVC.view addSubview:self.datePageControl];
}

- (ImageViewController *)viewControllerAtIndex:(NSUInteger)index
{
    ImageViewController *imgVC_Index = [[ImageViewController alloc]initWithNibName:@"ImageViewController" bundle:nil];
    [imgVC_Index.view setFrame:_datePageVC.view.frame];
    imgVC_Index.index = index;
//    if (index == 0 || index == 1) {
//        imgVC_Index.delegate = self;
//    }
    
    return imgVC_Index;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)dismissImageViewController:(UIButton *)button
//{
//    [self.pageVC.view removeFromSuperview];
//    
//    //Fade Animation
//    if (self.pageControl.currentPage == 0) {
//        MainViewController *mainVC = [[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
//        [mainVC.view setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//        [mainVC.view setAlpha:0.0f];
//        [self.view addSubview:mainVC.view];
//        [UIView beginAnimations:@"Fade" context:nil];
//        [UIView setAnimationDuration:1.5f];
//        [mainVC.view setAlpha:1.0f];
//        [UIView commitAnimations];
//    }
//    //Zoom Animation
//    else if (self.pageControl.currentPage == 1) {
//        //Uncomment for Zoom Effect => Need modify
//        /*CollectionViewController *collectionVC = [[CollectionViewController alloc]initWithNibName:@"CollectionViewController" bundle:nil];
//         [collectionVC.view setFrame:CGRectMake(self.view.bounds.size.width/4, self.view.bounds.size.height/4, 100, 100)];
//         [self.view addSubview:collectionVC.view];
//         [UIView beginAnimations:@"Zoom" context:nil];
//         [UIView setAnimationDuration:10.0f];
//         [collectionVC.view setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//         [UIView commitAnimations];*/
//        self.collectionVC = [[CollectionViewController alloc]initWithNibName:@"CollectionViewController" bundle:nil];
//        [self.collectionVC.view setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//        [self.collectionVC.view setAlpha:0.0f];
//        [self.view addSubview:self.collectionVC.view];
//        [UIView beginAnimations:@"Fade" context:nil];
//        [UIView setAnimationDuration:1.5f];
//        [self.collectionVC.view setAlpha:1.0f];
//        [UIView commitAnimations];
//    }
//}

#pragma mark - UIPageViewController Delegate
-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    //    NSLog(@"%i",self.pageControl.currentPage);
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [(ImageViewController *)viewController index];
    index++;
    if (index == 6) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [(ImageViewController *)viewController index];
    if (index == 0) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

-(void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    if ([pendingViewControllers count] > 0) {
        NSInteger pageIndex = [(ImageViewController *)[pendingViewControllers objectAtIndex:0] index];
        [self.datePageControl setCurrentPage:pageIndex];
    }
}


@end
