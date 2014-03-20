//
//  CoreDataViewController.h
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/19/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreDataViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) IBOutlet UITextField *nameTextField;
@property (nonatomic, strong) IBOutlet UITextField *authorTextField;
@property (nonatomic, strong) IBOutlet UITextField *lyricTextField;

@end
