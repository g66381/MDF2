//
//  CustomTableViewCell.m
//  MDF2_Project1
//
//  Created by Johnny Kay on 2/5/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell
@synthesize date, tweet, icon;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// Refreshes information in table view
-(void)refresh:(NSString *)firstStrng secondStrng:(NSString *)secondStrng thirdStrng:(NSString *)thirdStrng
{
    date.text = firstStrng;
    tweet.text = secondStrng;
    icon.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:thirdStrng]]];
}

@end