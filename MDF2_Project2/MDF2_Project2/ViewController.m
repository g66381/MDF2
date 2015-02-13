//
//  ViewController.m
//  MDF2_Project2
//
//  Created by Johnny Kay on 2/12/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import "ViewController.h"
#import "FollowerInfo.h"
#import "CustomCollectionViewCell.h"
#import "DetailViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    // Holds timeline info from api
    followerInfo = [[NSMutableArray alloc] init];
    friendsArray = [[NSArray alloc] init];
    [self RefreshTwit];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [followerInfo count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myColCell" forIndexPath:indexPath];
    if (cell != nil) {
        FollowerInfo *currentItem = [followerInfo objectAtIndex:indexPath.row];
        
        cell.screenName.text = currentItem.userName;
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
                            
                            NSString *requestUrl = @"https://api.twitter.com/1.1/friends/list.json?cursor=-1&skip_status=true&include_user_entities=false";
                            
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:requestUrl] parameters:nil];
                            
                            [request setAccount:curAcnt];
                            
                            [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                
                                if ((error == nil) && ([urlResponse statusCode] == 200)){
                                    
                                    NSDictionary *friends = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                    
                                    friendsArray = [friends objectForKey:@"users"];
                                    
                                    // Loops through friends list
                                    for (NSInteger i=0; i<[friendsArray count]; i++) {

                                        FollowerInfo *friendInfo = [self createFollowerInfoFromDictionary:[friendsArray objectAtIndex:i]];
                                        
                                        if (friendInfo != nil) {
                                            [followerInfo addObject:friendInfo];
                                        }
                                    }
                                    
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        [self.collectView reloadData];
                                    });
                                    
                                }
                                
                            }];
                            
                        }
                    }
                    
                }
                else {
                    
                    // User did not allow account access
                    errorAlert = [[UIAlertView alloc] initWithTitle:@"Account Access Not Granted"
                        message:@"We need access to your Twitter account in order to load your friends."
                        delegate:nil
                        cancelButtonTitle:@"Okay"
                        otherButtonTitles:nil];
                    
                    
                    errorMsg.text = @"Please go to your settings to allow access.";
                    
                    [errorAlert show];
                    
                }
            }];
        }
    }
    
}

// Copies api data to custom object
- (FollowerInfo *) createFollowerInfoFromDictionary:(NSDictionary *)postDict
{
    
    NSString *userSN = [postDict objectForKey:@"screen_name"];
    NSString *userImg = [postDict objectForKey:@"profile_image_url"];
    
    FollowerInfo *info = [[FollowerInfo alloc] initWithFollowerInfo:userSN img:userImg];
    
    return info;
}

// Sending information to different view controller for details
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Sends to Detail View Controller
    DetailViewController *detailVC = segue.destinationViewController;
    if (detailVC != nil) {
        UICollectionViewCell *cell = (UICollectionViewCell *)sender;
        NSIndexPath *indexPath = [_collectView indexPathForCell:cell];
        
        FollowerInfo *currentItem = [followerInfo objectAtIndex:indexPath.row];
        
        detailVC.currentItem = currentItem;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
