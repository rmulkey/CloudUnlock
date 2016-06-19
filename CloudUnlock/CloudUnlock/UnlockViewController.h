//
//  SecondViewController.h
//  SlideToUnlock
//
//  Created by Mulkey, Rodrigo S. on 6/9/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface UnlockViewController : UIViewController

@property (strong) NSManagedObject *eventHistory;
//@property (strong) NSManagedObjectContext *context;


@property (nonatomic, strong) NSMutableArray *events;

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSDate *eventDate;
@property (nonatomic, strong) NSString *status;

@end

