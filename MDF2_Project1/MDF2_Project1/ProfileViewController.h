//
//  ProfileViewController.h
//  MDF2_Project1
//
//  Created by Johnny Kay on 2/5/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostInfo.h"

@interface ProfileViewController : UIViewController
{
    
    IBOutlet UILabel *followersLbl;
    IBOutlet UILabel *friendsLbl;
    IBOutlet UILabel *user;
    IBOutlet UITextView *desc;
    IBOutlet UILabel *name;
    
}

-(IBAction)close:(id)sender;

@property (nonatomic, strong)PostInfo *currentItem;
@end
