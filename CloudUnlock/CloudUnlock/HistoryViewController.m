//
//  HistoryViewController.m
//  CloudUnlock
//
//  Created by Mulkey, Rodrigo S. on 6/17/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryTableViewCell.h"
#import "UnlockEvent.h"
#import "AppDelegate.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

@synthesize managedObjectContext;
@synthesize fetchedResultsController = _fetchedResultsController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDel = (AppDelegate*)[UIApplication sharedApplication].delegate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    
    [self fetchedResultsController];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"UnlockEvent"];
    self.historyList = [[self.appDel.managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.historyTableView reloadData];
    
}

#pragma mark - fetchedResultsController

- (NSFetchedResultsController *)fetchedResultsController {
    
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"UnlockEvent" inManagedObjectContext:self.appDel.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"eventDate" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:self.appDel.managedObjectContext sectionNameKeyPath:nil
                                                   cacheName:@"Root"];
    self.fetchedResultsController = theFetchedResultsController;
    _fetchedResultsController.delegate = self;
    
    return _fetchedResultsController;
}


#pragma mark - TableView Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.historyList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 55.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 420, 20)];
    
    label.backgroundColor = [UIColor clearColor];
    label.font = [label.font fontWithSize:15];
    label.text = @"History";
    label.textAlignment = NSTextAlignmentCenter;
    
    UIView *sectionHeader = [[UIView alloc] init];
    sectionHeader.backgroundColor = [UIColor whiteColor];
    [sectionHeader addSubview:label];
    
    return sectionHeader;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"historyCell";
    HistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[HistoryTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    NSManagedObject *event = [self.historyList objectAtIndex:indexPath.row];
    
    [cell.statusLabel setText:[NSString stringWithFormat:@"%@", [event valueForKey:@"status"]]];
    [cell.dateLabel setText:[NSString stringWithFormat:@"%@", [event valueForKey:@"eventDate"]]];
    [cell.nameLabel setText:[NSString stringWithFormat:@"%@", [event valueForKey:@"username"]]];

    return cell;
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.historyTableView endUpdates];
}


@end
