//
//  main.m
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/10/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ABCalendarPicker/ABCalendarPicker.h>

#import "HomeAppDelegate.h"

int main(int argc, char * argv[])
{
    [ABCalendarPicker class];
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([HomeAppDelegate class]));
    }
}
