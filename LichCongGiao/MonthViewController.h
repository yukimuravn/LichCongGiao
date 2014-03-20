//
//  MonthViewController.h
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/11/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import <EventKit/EventKit.h>
#import <ABCalendarPicker/ABCalendarPicker.h>

@interface MonthViewController : UIViewController <ABCalendarPickerDelegateProtocol, ABCalendarPickerDataSourceProtocol>

@property (nonatomic, assign) IBOutlet ABCalendarPicker *calendarPicker;
@property (nonatomic, strong) UIImageView *calendarShadow;

@property (nonatomic) EKEventStore *store;

@end
