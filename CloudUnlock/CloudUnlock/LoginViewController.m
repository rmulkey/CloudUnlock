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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnSubmitTapped:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:self.usernameTextField.text forKey:@"username"];
    [defaults synchronize];
    
}

@end
