//
//  HistoryViewController.m
//  CloudUnlock
//
//  Created by Mulkey, Rodrigo S. on 6/17/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryTableViewCell.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    
    [self fetchUnlockEvents];
}

- (void) fetchUnlockEvents {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //[self.historyList arrayWithObjects:[defaults objectForKey:@"username"], [defaults objectForKey:@"yourAnotherUserDefaultsEntryName"], nil];

}

#pragma mark - TableView Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Create and reuse cell
    
    static NSString *cellIdentifier = @"historyCell";
    
    HistoryTableViewCell *cell = [tableView
                         dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[HistoryTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:cellIdentifier];
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

// Adding a tableView Header

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

@end
