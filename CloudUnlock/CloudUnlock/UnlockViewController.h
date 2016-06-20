//
//  SecondViewController.h
//  SlideToUnlock
//
//  Created by Mulkey, Rodrigo S. on 6/9/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"


@interface UnlockViewController : UIViewController

@property (strong) NSManagedObject *eventHistory;
//@property (strong) NSManagedObjectContext *context;


@property (nonatomic, strong) NSMutableArray *events;

@property (nonatomic, strong) NSString *status;

@property (nonatomic) AppDelegate *appDel;

@end

