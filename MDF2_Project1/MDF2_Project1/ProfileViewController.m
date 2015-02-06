//
//  ProfileViewController.m
//  MDF2_Project1
//
//  Created by Johnny Kay on 2/5/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import "ProfileViewController.h"
#import "PostInfo.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    
    followersLbl.text = [self.currentItem.myFollowers stringValue];
    friendsLbl.text = [self.currentItem.myFriends stringValue];
    user.text = self.currentItem.userName;
    desc.text = self.currentItem.userDescription;
    name.text = self.currentItem.myName;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// Closes view back to table view
-(IBAction)close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
