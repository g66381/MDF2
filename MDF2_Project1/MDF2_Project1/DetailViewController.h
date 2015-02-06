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
    IBOutlet UILabel *userLbl;
    IBOutlet UITextView *tweetLbl;
    IBOutlet UILabel *dateLbl;
    
}

@property (nonatomic, strong)PostInfo *currentItem;

-(IBAction)close:(id)sender;
@end
