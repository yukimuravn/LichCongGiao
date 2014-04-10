//
//  MonthViewController.m
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/11/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import "MonthViewController.h"

@interface MonthViewController ()

@end

@implementation MonthViewController

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
    self.title = @"Tháng";
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
    
    //Set Up ABCalendarPicker
    self.calendarPicker.delegate = self;
    self.calendarPicker.dataSource = self;
    self.calendarPicker.calendar.firstWeekday = 2;
    [self.calendarPicker updateStateAnimated:NO];
    [self.view addSubview:self.calendarShadow];
    [self calendarPicker:self.calendarPicker animateNewHeight:self.calendarPicker.bounds.size.height];
//    if (self.calendarPicker.styleProvider == nil) {
//        NSLog(@"NO STYLE");
//    }
//    else {
//        NSLog(@"STYLE");
//        [self.calendarPicker.styleProvider setTextColor:[UIColor redColor]];
//    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = NO;
//    revealController.tapGestureRecognizer.enabled = NO;
    revealController = nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = YES;
//    revealController.tapGestureRecognizer.enabled = YES;
    revealController = nil;
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)eventsForDate:(NSDate *)date
{
    NSDateComponents * componentsBegin = [self.calendarPicker.calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
    NSDateComponents * componentsDay = [[NSDateComponents alloc] init];
    componentsDay.day = 1;
    
    NSDate * dayBegin = [self.calendarPicker.calendar dateFromComponents:componentsBegin];
    NSDate * dayEnd = [self.calendarPicker.calendar dateByAddingComponents:componentsDay toDate:dayBegin options:0];
    
    NSPredicate * predicate = [self.store predicateForEventsWithStartDate:dayBegin endDate:dayEnd calendars:nil];
    return [self.store eventsMatchingPredicate:predicate];
}

- (UIImageView*)calendarShadow
{
    if (_calendarShadow == nil)
    {
        _calendarShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CalendarShadow"]];
        _calendarShadow.opaque = NO;
    }
    return _calendarShadow;
}

#pragma mark - ABCalendarPicker delegate and dataSource

- (void)calendarPicker:(ABCalendarPicker *)calendarPicker
      animateNewHeight:(CGFloat)height
{
    self.calendarShadow.frame = CGRectMake(0,CGRectGetMaxY(self.calendarPicker.frame),
                                           self.calendarPicker.frame.size.width,
                                           self.calendarShadow.frame.size.height);
}

- (NSInteger)calendarPicker:(ABCalendarPicker*)calendarPicker
      numberOfEventsForDate:(NSDate*)date
                    onState:(ABCalendarPickerState)state
{
    if (state != ABCalendarPickerStateDays
        && state != ABCalendarPickerStateWeekdays)
    {
        return 0;
    }
    
    return [[self eventsForDate:date] count];
}


@end
