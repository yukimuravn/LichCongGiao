//
//  Saint.m
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/12/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import "Saint.h"

@implementation Saint
@synthesize image = _image;
@synthesize name = _name;

- (id)initWithName:(NSString *)saintName andImage:(UIImage *)saintImage
{
    if (self = [super init]){
		self.name = saintName;
        self.image = [ImageManipulator makeRoundCornerImage:saintImage :saintImage.size.width/2 :saintImage.size.height/2];
//        self.image = saintImage;
	}
	return self;
}

@end
