//
//  CustomCollectionViewCell.h
//  MDF2_Project2
//
//  Created by Johnny Kay on 2/12/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell
{
    IBOutlet UILabel *screenName;
    IBOutlet UIImageView *icon;
}

-(void)refresh:(NSString *)firstStrng secondStrng:(NSString *)secondStrng;

@property UILabel *screenName;
@property UIImageView *icon;

@end
