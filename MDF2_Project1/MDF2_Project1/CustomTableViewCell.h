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
    
}

-(void)refresh:(NSString *)firstStrng secondStrng:(NSString *)secondStrng thirdStrng:(NSString *)thirdStrng;

@property IBOutlet UIImageView *icon;
@property IBOutlet UILabel *date;
@property IBOutlet UITextView *tweet;
@end
