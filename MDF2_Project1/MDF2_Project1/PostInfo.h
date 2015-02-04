//
//  PostInfo.h
//  MDF2_Project1
//
//  Created by Johnny Kay on 2/3/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PostInfo : NSObject
{
    NSString *date;
    NSString *profileImg;
    NSString *userName;
    NSString *userDescription;
    NSString *tweetTxt;
}

@property (nonatomic, readonly)NSString *date;
@property (nonatomic, readonly)NSString *profileImg;
@property (nonatomic, readonly)NSString *userName;
@property (nonatomic, readonly)NSString *userDescription;
@property (nonatomic, readonly)NSString *tweetTxt;

- (id)initWithPostInfo:(NSString *)screenName img:(NSString *)img userDesc:(NSString *)userDesc text:(NSString *)text timeDateInfo:(NSString *)timeDateInfo;

@end
