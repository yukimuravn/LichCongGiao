//
//  HomeAppDelegate.h
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/10/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "DateViewController.h"
#import "MenuViewController.h"
#import "UIColor+MyColor.h"
#import <FacebookSDK/FacebookSDK.h>

@class SWRevealViewController;

@interface HomeAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SWRevealViewController *viewController;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
