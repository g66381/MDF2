//
//  DetailViewController.h
//  MDF2_Project2
//
//  Created by Johnny Kay on 2/12/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FollowerInfo.h"

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel *screenName;
    IBOutlet UIImageView *avatar;
}

-(IBAction)close:(id)sender;

@property (nonatomic, strong)FollowerInfo *currentItem;
@end
