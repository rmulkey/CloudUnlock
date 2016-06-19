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
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Access Denied"
                                                                             message:@"You don't have permission to unlock this door. Contact the Admin"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {}];
    
    [alertController addAction:defaultAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    self.username = @"test";
    self.isAccessDenied = YES;
    self.eventDate = [NSDate date];
    
    [self logUnlockEventToHistory];

}

- (void) logUnlockEventToHistory {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:self.username forKey:@"username"];
    [defaults setObject:self.eventDate forKey:@"date"];
    [defaults setInteger:self.isAccessDenied forKey:@"access"];
    
    [defaults synchronize];
    
    NSLog(@"Defaults: %@", [defaults objectForKey:@"username"]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
