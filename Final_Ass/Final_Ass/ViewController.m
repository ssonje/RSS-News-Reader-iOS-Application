//
//  ViewController.m
//  Final_Ass
//
//  Created by Sanket Sonje on 17/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)goToFirstVC:(id)sender {
    
    FirstViewController *FirstVC = [[FirstViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:FirstVC];
    
    [self presentViewController:navigationController animated:YES completion:nil];
}

@end
