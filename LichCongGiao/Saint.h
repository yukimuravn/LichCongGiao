//
//  Saint.h
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/12/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageManipulator.h"

@interface Saint : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) UIImage *image;

- (id)initWithName:(NSString *)name andImage:(UIImage *)img;

@end
