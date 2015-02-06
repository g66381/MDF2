//
//  ViewController.m
//  MDF2_Project1
//
//  Created by Johnny Kay on 2/3/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import "ViewController.h"
#import "PostInfo.h"
#import "CustomTableViewCell.h"
#import "ProfileViewController.h"
#import "DetailViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    twitterPosts = [[NSMutableArray alloc] init];
    [self RefreshTwit];
    
    reloadAlert = [[UIAlertView alloc] initWithTitle:@"Timeline Loading"
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [twitterPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (cell != nil) {
        PostInfo *currentItem = [twitterPosts objectAtIndex:indexPath.row];
        
        cell.tweet.text = currentItem.tweetTxt;
        cell.date.text = currentItem.date;
        cell.icon.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:currentItem.profileImg]]];
        
    }
    return cell;

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
                                    
                                    NSLog(@"%@", [twitFeed description]);
                                    
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        [self.timelineTbl reloadData];
                                    });
                                    
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


-(IBAction)onClick:(id)sender
{
    SLComposeViewController *composeView = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    [composeView setInitialText:@"Post from MDF2_Project1:"];
    [self presentViewController:composeView animated:true completion:nil];
}

- (PostInfo *) createPostInfoFromDictionary:(NSDictionary *)postDict
{
    NSString *timeDateStrng = [postDict valueForKey:@"created_at"];
    NSString *tweetTxt = [postDict valueForKey:@"text"];
    
    NSDictionary *userDict = [postDict objectForKey:@"user"];
    NSString *name = [userDict objectForKey:@"name"];
    NSNumber *followers = [userDict valueForKey:@"followers_count"];
    NSNumber *friends = [userDict valueForKey:@"friends_count"];
    NSString *userImg = [userDict objectForKey:@"profile_image_url"];
    NSString *userSN = [userDict objectForKey:@"screen_name"];
    NSString *userDesc = [userDict objectForKey:@"description"];
    
    PostInfo *postInf = [[PostInfo alloc] initWithPostInfo:userSN myName:name myFollowers:followers myFriends:friends img:userImg userDesc:userDesc text:tweetTxt timeDateInfo:timeDateStrng];
    
    return postInf;
}

// Sending information to second view controller for details
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *detailVC = segue.destinationViewController;
    if (detailVC != nil) {
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [_timelineTbl indexPathForCell:cell];
        
        PostInfo *currentItem = [twitterPosts objectAtIndex:indexPath.row];
        
        detailVC.currentItem = currentItem;
    }
    
    ProfileViewController *profileVC = segue.destinationViewController;
    if (profileVC != nil) {
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [_timelineTbl indexPathForCell:cell];
        
        PostInfo *currentItem = [twitterPosts objectAtIndex:indexPath.row];
        
        profileVC.currentItem = currentItem;
    }
    
}

-(IBAction)refresh:(id)sender
{
    [reloadAlert show];
    [twitterPosts removeAllObjects];
    [self RefreshTwit];
    [reloadAlert dismissWithClickedButtonIndex:0 animated:true];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
