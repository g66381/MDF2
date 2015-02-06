//
//  CustomTableViewCell.h
//  MDF2_Project1
//
//  Created by Johnny Kay on 2/5/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
{
    IBOutlet UIImageView *icon;
    IBOutlet UILabel *date;
    IBOutlet UITextView *tweet;
    
}

-(void)refresh:(NSString *)firstStrng secondStrng:(NSString *)secondStrng thirdStrng:(NSString *)thirdStrng;

@property UIImageView *icon;
@property UILabel *date;
@property UITextView *tweet;
@end
