//
//  LoginViewController.m
//  CloudUnlock
//
//  Created by Mulkey, Rodrigo S. on 6/20/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUsersList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) createUsersList {
    
     self.users = @{@"rodrigo" : @"rodrigo", @"babet": @"babet", @"rick": @"rick", @"admin": @"admin"};
                                                                    
 
}

- (IBAction)btnSubmitTapped:(id)sender {
    
    for (NSString* key in [self.users allKeys]) {
        if (([key isEqualToString:self.usernameTextField.text]) && ([key isEqualToString:self.passwordTextField.text])) {
        
            [[NSUserDefaults standardUserDefaults] setValue:@"Success" forKey:@"status"];
            
            [self performSegueWithIdentifier:@"tabBarRootView" sender:self];

            break;
            
        } else {
            
            [[NSUserDefaults standardUserDefaults] setValue:@"Access Denied" forKey:@"status"];
        }
        
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:self.usernameTextField.text forKey:@"username"];
    [defaults synchronize];
        
    }
}

@end
