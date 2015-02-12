//
//  CustomCollectionViewCell.m
//  MDF2_Project2
//
//  Created by Johnny Kay on 2/12/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell
@synthesize screenName, icon;

// Refreshes information in table view
-(void)refresh:(NSString *)firstStrng secondStrng:(NSString *)secondStrng
{
    screenName.text = firstStrng;
    icon.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:secondStrng]]];
}

@end
