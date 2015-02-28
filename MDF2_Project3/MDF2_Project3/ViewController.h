//
//  ViewController.h
//  MDF2_Project3
//
//  Created by Johnny Kay on 2/18/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PhotoViewController;
@class VideoViewController;

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    
}

-(IBAction)photoClick:(id)sender;
-(IBAction)galleryClick:(id)sender;

@property (strong, nonatomic)PhotoViewController *imgDetailVC;
@property (strong, nonatomic)VideoViewController *vidDetailVC;
@end

