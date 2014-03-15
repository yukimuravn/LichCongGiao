//
//  SaintViewController.m
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/11/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import "SaintViewController.h"

@interface SaintViewController ()
{
    NSMutableArray *saintArray;
}

@end

@implementation SaintViewController
@synthesize saintCollectionView = _saintCollectionView;

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
    self.title = @"Thánh";
    [self.view setBackgroundColor:[UIColor magentaColor]];
    
    if (IS_IOS_7){
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    //Set Up SaintArray
    saintArray = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        Saint *saint = [[Saint alloc]initWithName:[NSString stringWithFormat:@"Saint%i",i] andImage:[UIImage imageNamed:[NSString stringWithFormat:@"img%i",i]]];
        [saintArray addObject:saint];
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
    [searchBtn addTarget:self action:@selector(reloadDataUICollectionView) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *search_btn = [[UIBarButtonItem alloc]initWithCustomView:searchBtn];
    self.navigationItem.rightBarButtonItem = search_btn;
    
    //Set Up UICollectionView
    CGSize size = [[UIScreen mainScreen] bounds].size;
    NSLog(@"%@",NSStringFromCGSize(size));
    if (!_saintCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setItemSize:CGSizeMake(80, 100)];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        self.saintCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        self.saintCollectionView.delegate = self;
        self.saintCollectionView.dataSource = self;
        [self.saintCollectionView registerClass:[SaintCell class] forCellWithReuseIdentifier:@"SaintViewCell"];
        [self.saintCollectionView setBackgroundColor:[UIColor lightGrayColor]];
        [self.saintCollectionView setFrame:CGRectMake(0, 0, size.width, size.height - 64 )];
        [self.saintCollectionView setShowsHorizontalScrollIndicator:YES];
        self.saintCollectionView.scrollEnabled = YES;
        self.saintCollectionView.pagingEnabled = NO;
        [self.view addSubview:self.saintCollectionView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadDataUICollectionView
{
    [saintArray removeLastObject];
    NSLog(@"%i", [saintArray count]);
    [self.saintCollectionView reloadData];
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [saintArray count];
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 15;
//}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 20;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20.0f, 20.0f, 20.0f, 20.0f);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SaintViewCell";
    SaintCell *cell = (SaintCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
//    [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"img%li",(long)indexPath.row]]];
//    [cell.label setText:[NSString stringWithFormat:@"img%li", (long)indexPath.row]];
    Saint *saint = [saintArray objectAtIndex:indexPath.row];
    [cell.imageView setImage:saint.image];
    [cell.imageView setBackgroundColor:[UIColor clearColor]];
    [cell.label setText:saint.name];
//    [cell.label setBackgroundColor:[UIColor purpleColor]];
//    [cell.contentView setOpaque:YES];
//    [cell.backgroundView setOpaque:YES];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Saint *saint = [saintArray objectAtIndex:indexPath.row];
    SaintInfoViewController *saintInfoVC = [[SaintInfoViewController alloc]initWithNibName:@"SaintInfoViewController" bundle:nil];
    saintInfoVC.saintName = saint.name;
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Trở Lại" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    [self.navigationController pushViewController:saintInfoVC animated:YES];
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

@end
