//
//  HistoryViewController.h
//  CloudUnlock
//
//  Created by Mulkey, Rodrigo S. on 6/17/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *historyTableView;
@property (strong, nonatomic) NSArray *historyList;

@end
