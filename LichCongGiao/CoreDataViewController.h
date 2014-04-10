//
//  CoreDataViewController.h
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/19/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreDataViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextField *authorTextField;
@property (nonatomic, weak) IBOutlet UITextField *lyricTextField;

@end
