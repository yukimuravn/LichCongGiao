//
//  UIImage+Resize.h
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/14/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end
