//
//  SecondViewController.m
//  SlideToUnlock
//
//  Created by Mulkey, Rodrigo S. on 6/9/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import "UnlockViewController.h"
#import "CircularLock.h"

@interface UnlockViewController ()

@end

@implementation UnlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDel = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [self createCircularLock];

}

- (void) createCircularLock {
    
    CircularLock *circularLock = [[CircularLock alloc] initWithCenter:self.view.center
                                                               radius:80
                                                             duration:2.0
                                                          strokeWidth:15
                                                            ringColor:[UIColor greenColor]
                                                          strokeColor:[UIColor whiteColor]
                                                          lockedImage:[UIImage imageNamed:@"lockedTransparent.png"]
                                                        unlockedImage:[UIImage imageNamed:@"unlocked.png"]
                                                             isLocked:YES
                                                    didlockedCallback:^{
                                                        NSLog(@"locked");
                                                    }
                                                  didUnlockedCallback:^{
                                                      NSLog(@"unlocked");
                                                      [self verifyPermissions];
                                                  }];
    
    [self.view addSubview:circularLock];
    
}

- (void) verifyPermissions {
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"status"] isEqualToString:@"Success"]) {
        
    } else {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Access Denied"
                                                                             message:@"You don't have permission to unlock this door. Contact the Admin"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {}];
    
    [alertController addAction:defaultAction];
    [self presentViewController:alertController animated:YES completion:nil];
    }
    
    [self logUnlockEventToHistory];

}

- (void) logUnlockEventToHistory {
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSManagedObject *newEvent = [NSEntityDescription insertNewObjectForEntityForName:@"UnlockEvent" inManagedObjectContext:managedObjectContext];
    
    [newEvent setValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"username"] forKey:@"username"];
    [newEvent setValue:[self getStringFromDate] forKey:@"eventDate"];
    [newEvent setValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"status"] forKey:@"status"];
    
    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
        NSLog(@"Save Failed! %@ %@", error, [error localizedDescription]);
    } else {
        NSLog(@"Saved!");
    }
    
    NSLog(@"Event %@", newEvent);

}

-(NSString *)getStringFromDate {
    
    NSString *stringDate = [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterShortStyle];
    
    return stringDate;
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
