//
//  CustomTableViewCell.h
//  MDF2_Project1
//
//  Created by Johnny Kay on 2/3/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
{
    IBOutlet UIImage *img;
    IBOutlet UILabel *userLbl;
    IBOutlet UITextView *textLbl;
    IBOutlet UILabel *dateLbl;
}

-(void)refresh:(NSString *)firstStrng secondStrng:(NSString *)secondStrng thirdStrng:(NSString *)thirdStrng;

@end
