//
//  FollowerInfo.h
//  MDF2_Project2
//
//  Created by Johnny Kay on 2/12/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FollowerInfo : NSObject
{
    NSString *profileImg;
    NSString *userName;
}


@property (nonatomic, readonly)NSString *profileImg;
@property (nonatomic, readonly)NSString *userName;

- (id)initWithFollowerInfo:(NSString *)screenName img:(NSString *)img;

@end
