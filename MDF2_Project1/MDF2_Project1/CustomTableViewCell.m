//
//  CustomTableViewCell.m
//  MDF2_Project1
//
//  Created by Johnny Kay on 2/3/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)refresh:(NSString *)firstStrng secondStrng:(NSString *)secondStrng thirdStrng:(NSString *)thirdStrng;
{
    userLbl.text = firstStrng;
    textLbl.text = secondStrng;
    dateLbl.text = thirdStrng;
}

@end
