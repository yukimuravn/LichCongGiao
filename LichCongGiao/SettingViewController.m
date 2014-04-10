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
@synthesize animationImg = _animationImg;
@synthesize myBall = _myBall;
@synthesize myDynamicAnimator = _myDynamicAnimator;
@synthesize isBallRolling = _isBallRolling;

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
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    if (IS_IOS_7){
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
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
    
    //Set Up UIImageView Animation
    
//    self.animationImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"yukimura_fbprofile"]];
//    [self.animationImg setFrame:CGRectMake(0, 0, 171, 171)];
//    [self.view addSubview:self.animationImg];
//    [self rotate:nil finished:nil context:nil];
    
//    [UIView animateWithDuration:4.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        animateImg.frame = CGRectMake(100, 100, animateImg.frame.size.width, animateImg.frame.size.height);
//    }completion:^(BOOL finished){
//        if (finished) {
//            [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
//                             animations:^{
//                                 animateImg.alpha = 0.5;
//                                 animateImg.transform = CGAffineTransformRotate(animateImg.transform, M_PI);
//                             }
//                             completion:^(BOOL finished){
//                                 if (finished) {
//                                     [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//                                         animateImg.alpha = 1;
//                                         animateImg.transform = CGAffineTransformScale(animateImg.transform, 0.5, 0.5);
//                                     }
//                                    completion:nil];
//                                 }
//                             }];
//        }
//    }];
    
    //Set Up UIKit Dynamic - A UIView Ball
    self.myBall = [[UIView alloc]initWithFrame:CGRectMake(110, 0, 50, 50)];
    [self.myBall setBackgroundColor:[UIColor yellowColor]];
    [self.myBall.layer setBorderColor:[UIColor purpleColor].CGColor];
    [self.myBall.layer setBorderWidth:1.0];
    [self.myBall.layer setCornerRadius:self.myBall.frame.size.width/2];
    [self.view addSubview:self.myBall];
    
    //Set Up UIKit Dynamic Animator
    self.myDynamicAnimator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    self.isBallRolling = NO;
    [self demoGravity];
}

- (void)demoGravity
{
//    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc]initWithItems:@[self.myBall]];
//    [self.myDynamicAnimator addBehavior:gravityBehavior];
    
    UIView *redBarrier = [[UIView alloc]initWithFrame:CGRectMake(0, 250, 320, 20)];
    [redBarrier setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:redBarrier];
    UIView *yellowBarrier = [[UIView alloc]initWithFrame:CGRectMake(120, 320, 200, 20)];
    [yellowBarrier setBackgroundColor:[UIColor yellowColor]];
//    [self.view addSubview:yellowBarrier];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc]initWithItems:@[self.myBall]];
//    [collisionBehavior addBoundaryWithIdentifier:@"redBarrier" fromPoint:CGPointMake(0, 250) toPoint:CGPointMake(320, 250)];
//    [collisionBehavior addBoundaryWithIdentifier:@"yellowBarrier" fromPoint:CGPointMake(120, 320) toPoint:CGPointMake(320, 320)];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    collisionBehavior.collisionMode = UICollisionBehaviorModeEverything;
    collisionBehavior.collisionDelegate = self;
    [self.myDynamicAnimator addBehavior:collisionBehavior];
    
    UIDynamicItemBehavior *ballBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.myBall]];
    ballBehavior.elasticity = 0.6; //Sự đàn hồi
    ballBehavior.friction = 1.0; //Sự ma sát
    ballBehavior.density = 1.5;//Khối lượng riêng
    ballBehavior.resistance = 0.5;
    ballBehavior.angularResistance = 0.5;
    [self.myDynamicAnimator addBehavior:ballBehavior];
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc]initWithItems:@[self.myBall]];
    gravityBehavior.gravityDirection = CGVectorMake(0, 1);
    [self.myDynamicAnimator addBehavior:gravityBehavior];
}

#pragma mark - UICollisionBehaviorDelegate

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    UIView *view = (UIView *)item;
    [view setBackgroundColor:[UIColor cyanColor]];
    
//    UIView *newBall = [[UIView alloc]initWithFrame:CGRectMake(110, 0, 50, 50)];
//    [newBall setBackgroundColor:[UIColor yellowColor]];
//    [newBall.layer setBorderColor:[UIColor purpleColor].CGColor];
//    [newBall.layer setBorderWidth:1.0];
//    [newBall.layer setCornerRadius:newBall.frame.size.width/2];
//    [self.view addSubview:newBall];
//    UIAttachmentBehavior *attachBehavior = [[UIAttachmentBehavior alloc]initWithItem:view attachedToItem:newBall];
//    [self.myDynamicAnimator addBehavior:attachBehavior];
    
//    [UIView animateWithDuration:0.3 animations:^{
//        [view setBackgroundColor:[UIColor redColor]];
//    }];

}

- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier
{
//    UIView *view = (UIView *)item;
//    [view setBackgroundColor:[UIColor redColor]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.isBallRolling) {
        UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[self.myBall] mode:UIPushBehaviorModeInstantaneous];
        pushBehavior.magnitude = -1;
        pushBehavior.pushDirection = CGVectorMake(0, -1);
        [self.myDynamicAnimator addBehavior:pushBehavior];
        
//        UIAttachmentBehavior *attachBehavior = [[UIAttachmentBehavior alloc]initWithItem:self.myBall attachedToAnchor:CGPointMake(160, 160)];
//        [self.myDynamicAnimator addBehavior:attachBehavior];
//        
//        UISnapBehavior *snapBehavior = [[UISnapBehavior alloc]initWithItem:self.myBall snapToPoint:CGPointMake(300, 300)];
//        [self.myDynamicAnimator addBehavior:snapBehavior];
        
//        self.isBallRolling = YES;
    }
    
    
}

- (void)rotate:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [UIView setAnimationDelegate:self];
                         [UIView setAnimationDidStopSelector:@selector(moveToCenter:finished:context:)];
                         self.animationImg.transform = CGAffineTransformRotate(self.animationImg.transform, M_PI);
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
}

- (void)moveToCenter:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [UIView setAnimationDelegate:self];
                         [UIView setAnimationDidStopSelector:@selector(rotate:finished:context:)];
                         self.animationImg.center = self.view.center;
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
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
