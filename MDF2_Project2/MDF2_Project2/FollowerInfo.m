//
//  FollowerInfo.m
//  MDF2_Project2
//
//  Created by Johnny Kay on 2/12/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import "FollowerInfo.h"

@implementation FollowerInfo
@synthesize userName, profileImg;

- (id)initWithFollowerInfo:(NSString *)screenName img:(NSString *)img
{
    if (self = [super init]) {
        userName = [screenName copy];
        profileImg = [img copy];
    }
    
    return self;
}

@end
