//
//  UserDetailViewController.m
//  Keet
//
//  Created by Eduardo Cristerna on 24/04/15.
//  Copyright (c) 2015 José Alberto Esquivel. All rights reserved.
//

#import "UserDetailViewController.h"
#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface UserDetailViewController ()

@end

@implementation UserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDataFromDatabase];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Database

-(void)loadDataFromDatabase {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    PFQuery *query = [PFQuery queryWithClassName: @"User"];
    [query selectKeys: @[@"username", @"puntos"]];
    [query whereKey: @"email" equalTo: appDelegate.user];
    
    PFObject *user = [query getFirstObject];
    
    self.navigationItem.title = user[@"username"];
    self.lblEmail.text = appDelegate.user;
    self.lblPoints.text = user[@"puntos"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
