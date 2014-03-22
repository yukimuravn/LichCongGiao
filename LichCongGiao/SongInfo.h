//
//  SongInfo.h
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/19/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SongInfo : NSManagedObject

@property (nonatomic, retain) NSNumber * songid;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * lyric;
@property (nonatomic, retain) NSString * author;

@end
