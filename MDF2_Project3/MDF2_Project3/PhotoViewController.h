//
//  PhotoViewController.h
//  MDF2_Project3
//
//  Created by Johnny Kay on 2/20/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface PhotoViewController : UIViewController
{
    IBOutlet UIImageView *editImg;
    IBOutlet UIImageView *originalImg;
    
    UIAlertView *saveAlert;
    UIAlertView *errorAlert;
    
}


-(IBAction)close:(id)sender;
-(IBAction)saveImg:(id)sender;

@property UIImage *edited;
@property UIImage *original;
@end
