//
//  MusicViewController.m
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/11/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#import "MusicViewController.h"

@interface MusicViewController ()
{
    SongInfo *fetchedSongInfo;
}

@end

@implementation MusicViewController
@synthesize musicTableView = _musicTableView;
@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize managedObjectContext = _managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Nhạc";
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    //Set Up MenuButton
    SWRevealViewController *revealController = [self revealViewController];
    UIImage *menuIcon = [UIImage imageNamed:@"menu-icon"];
    UIButton *menuBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, menuIcon.size.width, menuIcon.size.height)];
    [menuBtn setBackgroundImage:menuIcon forState:UIControlStateNormal];
    [menuBtn setShowsTouchWhenHighlighted:YES];
    [menuBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menu_btn = [[UIBarButtonItem alloc]initWithCustomView:menuBtn];
    self.navigationItem.leftBarButtonItem = menu_btn;
    
    //Set Up TableView
    CGSize size = [[UIScreen mainScreen] bounds].size;
    if (!_musicTableView) {
        self.musicTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height) style:UITableViewStylePlain];
        self.musicTableView.dataSource = self;
        self.musicTableView.delegate = self;
        [self.view addSubview:self.musicTableView];
    }
    
    //Init CoreData SongInfo
    self.managedObjectContext = [self managedObjectContext];
//    for (int i = 0; i < 15; i++) {
//        SongInfo *songInfo = [NSEntityDescription insertNewObjectForEntityForName:@"SongInfo" inManagedObjectContext:self.managedObjectContext];
//        songInfo.songid = [NSNumber numberWithInt:i];
//        songInfo.name = [NSString stringWithFormat:@"Bài Hát %@",songInfo.songid];
//        songInfo.author = [NSString stringWithFormat:@"Tác Giả %@",songInfo.songid];
//        songInfo.lyric = @"Yukimura Imba";
//    }
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }

//    // Test listing all FailedBankInfos from the store
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SongInfo"
//                                              inManagedObjectContext:context];
//    [fetchRequest setEntity:entity];
//    NSError *error;
//    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
//    fetchedSongInfo = [fetchedObjects objectAtIndex:0];
    NSError *fetchError;
	if (![[self fetchedResultsController] performFetch:&fetchError]) {
		// Update to handle the error appropriately.
		NSLog(@"Unresolved error %@, %@", fetchError, [fetchError userInfo]);
		exit(-1);  // Fail
	}
    
    //Set JSON Data
    NSError *err;
    NSString* dataPath = [[NSBundle mainBundle] pathForResource:@"Song" ofType:@"json"];
    NSArray* songs = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:dataPath]
                                                     options:kNilOptions
                                                       error:&err];
    //Add JSON Data to CoreData
    for (int i = 0; i < [songs count]; i++) {
        NSDictionary *songDict = [songs objectAtIndex:i];
        NSString *author = [songDict valueForKey:@"author"];
        NSString *name = [songDict valueForKey:@"name"];
        NSNumber *songid = [songDict valueForKey:@"songid"];
        NSString *lyric = [songDict valueForKey:@"lyric"];
        SongInfo *songInfo = [NSEntityDescription insertNewObjectForEntityForName:@"SongInfo" inManagedObjectContext:self.managedObjectContext];
        songInfo.songid = songid;
        songInfo.name = name;
        songInfo.author = author;
        songInfo.lyric = lyric;
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.fetchedResultsController = nil;
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
//    return 15;
    id  sectionInfo = [[_fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
//    // Test listing all FailedBankInfos from the store
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SongInfo"
//                                              inManagedObjectContext:self.managedObjectContext];
//    [fetchRequest setEntity:entity];
//    NSError *error;
//    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
//    fetchedSongInfo = [fetchedObjects objectAtIndex:0];

    fetchedSongInfo = [_fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = fetchedSongInfo.name;
    cell.detailTextLabel.text = fetchedSongInfo.author;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Default UITableViewCell
    static NSString *cellIdentifier = @"musicCell";
    UITableViewCell *cell = (UITableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    [self configureCell:cell atIndexPath:indexPath];
//    cell.textLabel.text = fetchedSongInfo.name; //[NSString stringWithFormat:@"Bài Hát 0%i",indexPath.row];
//    cell.detailTextLabel.text = fetchedSongInfo.author; //@"123";
    //
    //    MenuCell *cell = (MenuCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //    if (cell == nil)
    //    {
    //        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
    //        cell = [nib objectAtIndex:0];
    //    }
    //
    //    cell.label.text = [menuArrayName objectAtIndex:indexPath.row];
    //    cell.label.textColor = [UIColor whiteColor];
    //    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"menu-cell-0%li",(long)indexPath.row]];
    //    cell.backgroundColor = [UIColor clearColor];
    //    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    return cell;
}

// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [theTableView cellForRowAtIndexPath:indexPath];
    NSString *cellTitle = selectedCell.textLabel.text;
    
    MusicInfoViewController *musicInfoVC = [[MusicInfoViewController alloc]initWithNibName:@"MusicInfoViewController" bundle:nil];
    musicInfoVC.title = cellTitle;
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Trở Lại" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    [self.navigationController pushViewController:musicInfoVC animated:YES];
    [theTableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark -
#pragma mark - CoreData Methods
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (NSFetchedResultsController *)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"SongInfo" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"songid" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil
                                                   cacheName:@"cache_musicVC"];
    self.fetchedResultsController = theFetchedResultsController;
    _fetchedResultsController.delegate = (id)self;
    
    return _fetchedResultsController;
    
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    [self.musicTableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.musicTableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray
                                               arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray
                                               arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id )sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [self.musicTableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.musicTableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller has sent all current change notifications, so tell the table view to process all updates.
    [self.musicTableView endUpdates];
}


@end
