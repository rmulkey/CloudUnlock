//
//  SecondViewController.h
//  SlideToUnlock
//
//  Created by Mulkey, Rodrigo S. on 6/9/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnlockViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *event;

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSDate *eventDate;
@property (nonatomic, assign) BOOL isAccessDenied;

@end

