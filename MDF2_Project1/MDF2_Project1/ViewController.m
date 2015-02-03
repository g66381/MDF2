//
//  ViewController.m
//  MDF2_Project1
//
//  Created by Johnny Kay on 2/3/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil) {
        
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil) {
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
                if (granted) {
                    
                    // User allowed account access
                    NSArray *twitAcnts = [accountStore accountsWithAccountType:accountType];
                    if (twitAcnts != nil) {
                        ACAccount *curAcnt = [twitAcnts objectAtIndex:0];
                        if (curAcnt != nil) {
                            user.text = (curAcnt.username);
                        }
                    }
                    
                }
                else {
                    //User said no
                }
            }];
        }
    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
