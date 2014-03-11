//
//  ImageViewController.h
//  PageViewControllerDemo
//
//  Created by Nguyễn Mạnh Huy on 3/7/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol ImageViewControllerDelegate <NSObject>
//
//- (void)dismissImageViewController:(UIButton *)button;
//
//@end

@interface ImageViewController : UIViewController 

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, assign) NSInteger index;
//@property (nonatomic,weak) id<ImageViewControllerDelegate> delegate;

@end
