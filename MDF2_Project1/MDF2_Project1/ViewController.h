//
//  ViewController.h
//  MDF2_Project1
//
//  Created by Johnny Kay on 2/3/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *twitterPosts;
    
    IBOutlet UILabel *user;
}

-(IBAction)onClick:(id)sender;

@property IBOutlet UITableView *timelineTbl;
@end

