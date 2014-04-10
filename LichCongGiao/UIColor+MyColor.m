//
//  UIColor+MyColor.m
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/26/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import "UIColor+MyColor.h"

@implementation UIColor (MyColor)

+ (UIColor *)myGreenColor
{
    static UIColor *color = nil;
    if (!color) color = [UIColor colorWithRed:90/255.0f green:154/255.0f blue:168/255.0f alpha:1];
    return color;
}

@end
