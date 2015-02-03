//
//  ViewController.m
//  MDF2_Project1
//
//  Created by Johnny Kay on 2/3/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [self RefreshTwit];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)RefreshTwit
{
    
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
                            
                            NSString *requestUrl = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
                            
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:requestUrl] parameters:nil];
                            
                            [request setAccount:curAcnt];
                            
                            [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                
                                if ((error == nil) && ([urlResponse statusCode] == 200)){
                                    
                                    NSArray *twitFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                    
                                    NSLog(@"response = %@", [twitFeed description]);
                                    
                                }
    
                            }];
                            
                        }
                    }
                    
                }
                else {
                    //User said no
                }
            }];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
