//
//  HistoryTableViewCell.h
//  CloudUnlock
//
//  Created by Mulkey, Rodrigo S. on 6/17/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIImageView *statusImage;

@end
