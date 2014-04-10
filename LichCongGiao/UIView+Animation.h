//
//  UIView+Animation.h
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/23/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)

- (void) moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;
- (void) downUnder:(float)secs option:(UIViewAnimationOptions)option;

@end
