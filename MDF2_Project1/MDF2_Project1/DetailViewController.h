//
//  DetailViewController.h
//  MDF2_Project1
//
//  Created by Johnny Kay on 2/5/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostInfo.h"

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel *date;
    IBOutlet UILabel *user;
    IBOutlet UITextView *tweet;
    
}

@property (nonatomic, strong)PostInfo *currentItem;

-(IBAction)close:(id)sender;
@end
