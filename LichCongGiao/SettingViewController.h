//
//  SettingViewController.h
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/11/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "CoreDataViewController.h"
#import "Define.h"
#import "UIView+Animation.h"

@interface SettingViewController : UIViewController <UICollisionBehaviorDelegate>

@property (nonatomic, strong) UIImageView *animationImg;
@property (nonatomic, strong) UIView *myBall;
@property (nonatomic, strong) UIDynamicAnimator *myDynamicAnimator;
@property (nonatomic) BOOL isBallRolling;

@end
