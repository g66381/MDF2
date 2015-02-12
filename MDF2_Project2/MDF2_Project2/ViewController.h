//
//  ViewController.h
//  MDF2_Project2
//
//  Created by Johnny Kay on 2/12/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSMutableArray *followerInfo;
    NSArray *friendsArray;
    
    UIAlertView *errorAlert;
    IBOutlet UILabel *errorMsg;
}

@property IBOutlet UICollectionView *collectView;
@end

