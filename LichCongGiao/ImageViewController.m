//
//  ImageViewController.m
//  PageViewControllerDemo
//
//  Created by Nguyễn Mạnh Huy on 3/7/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
{
    UIButton *clickToStartButton;
}

@end

@implementation ImageViewController
@synthesize imgView = _imgView;
@synthesize index = _index;
//@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSString *imgName = [NSString stringWithFormat:@"img%li",(long)_index];
    UIImage *img = [UIImage imageNamed:imgName];
    [self.imgView setImage:img];
    
//    [self.imgView setUserInteractionEnabled:YES];
//    
//    if (_index == 0) {
//        clickToStartButton = [UIButton buttonWithType:UIButtonTypeSystem];
//        [self.imgView addSubview:clickToStartButton];
//        [clickToStartButton setFrame:CGRectMake(20, self.imgView.bounds.size.height - 100, 280, 44)];
//        [clickToStartButton setBackgroundColor:[UIColor blueColor]];
//        [clickToStartButton addTarget:self action:@selector(clickToStartButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
//        [clickToStartButton setTitle:@"MainViewController" forState:UIControlStateNormal];
//    }
//    else if (_index == 1) {
//        clickToStartButton = [UIButton buttonWithType:UIButtonTypeSystem];
//        [self.imgView addSubview:clickToStartButton];
//        [clickToStartButton setFrame:CGRectMake(20, self.imgView.bounds.size.height - 100, 280, 44)];
//        [clickToStartButton setBackgroundColor:[UIColor blueColor]];
//        [clickToStartButton addTarget:self action:@selector(clickToStartButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
//        [clickToStartButton setTitle:@"CollectionViewController" forState:UIControlStateNormal];
//    }

    [self.view addSubview:_imgView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGSize size = [[UIScreen mainScreen] bounds].size;
    if (!self.imgView) {
        self.imgView = [[UIImageView alloc]init];
        [self.imgView setFrame:CGRectMake(0, 0, size.width, size.height)];
    }
    
}

//- (void)clickToStartButtonTapped:(UIButton *)clickButton
//{
//    if (self.delegate && [self.delegate respondsToSelector:@selector(dismissImageViewController:)]) {
//        [self.delegate dismissImageViewController:clickButton];
//    }
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (UIImage*)resizeImage:(UIImage *)image imageSize:(CGSize)size
//{
//    UIGraphicsBeginImageContext(size);
//    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
//    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
//    //here is the scaled image which has been changed to the size specified
//    UIGraphicsEndImageContext();
//    return newImage;
//}

@end
