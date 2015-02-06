//
//  PostInfo.m
//  MDF2_Project1
//
//  Created by Johnny Kay on 2/3/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import "PostInfo.h"

@implementation PostInfo
@synthesize myName, myFollowers, myFriends, date, profileImg, userName, userDescription, tweetTxt;

- (id)initWithPostInfo:(NSString *)screenName myName:(NSString *)name myFollowers:(NSNumber *)followers myFriends:(NSNumber *)friends img:(NSString *)img userDesc:(NSString *)userDesc text:(NSString *)text timeDateInfo:(NSString *)timeDateInfo;
{
    if ((self = [super init])) {

        myName = [name copy];
        myFollowers = [followers copy];
        myFriends = [friends copy];
        userName = [screenName copy];
        userDescription = [userDesc copy];
        tweetTxt = [text copy];
        profileImg = [img copy];
        date = [timeDateInfo copy];
    }
    return self;
}

@end
