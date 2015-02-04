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

#import "PostInfo.h"
#import "CustomTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [self RefreshTwit];
    twitterPosts = [[NSMutableArray alloc] init];
    
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
                                    
                                    // Loops through twitter feed
                                    for (NSInteger i=0; i<[twitFeed count]; i++) {
                                        PostInfo *feedInfo = [self createPostInfoFromDictionary:[twitFeed objectAtIndex:i]];
                                        
                                        if (feedInfo != nil) {
                                            [twitterPosts addObject:feedInfo];
                                        }
                                    }
                                    
                                }
    
                            }];
                            
                        }
                    }
                    
                }
                else {
                    
                    // User did not allow account access
                    
                }
            }];
        }
    }
    
}

- (PostInfo *) createPostInfoFromDictionary:(NSDictionary *)postDict
{
    NSString *timeDateStrng = [postDict valueForKey:@"created_at"];
    NSString *tweetTxt = [postDict valueForKey:@"text"];
    
    NSDictionary *userDict = [postDict objectForKey:@"user"];
    NSString *userImg = [userDict objectForKey:@"profile_image_url"];
    NSString *userSN = [userDict objectForKey:@"screen_name"];
    NSString *userDesc = [userDict objectForKey:@"description"];
    
    PostInfo *postInf = [[PostInfo alloc] initWithPostInfo:userSN img:userImg userDesc:userDesc text:tweetTxt timeDateInfo:timeDateStrng];
    
    return postInf;
}

// Required for table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [twitterPosts count];
}

// Loads information to custom cells in table
- (UITableViewCell *)tblView:(UITableView *)tblView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomTableViewCell *cell = [tblView dequeueReusableCellWithIdentifier:@"myCell"];
    if (cell != nil) {
        PostInfo *currentItem = [twitterPosts objectAtIndex:indexPath.row];
        
        [cell refresh:currentItem.userName secondStrng:currentItem.tweetTxt thirdStrng:currentItem.date];
    }
    return cell;
}

// Required for table view
- (void)tblView:(UITableView *)tblView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [twitterPosts removeObjectAtIndex:indexPath.row];
        
        [tblView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
