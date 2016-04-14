//
//  MEMUserInfoSyncClient.m
//  MemoryProblems
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

#import "MEMUserInfoSyncClient.h"

@interface MEMUserInfoSyncClient ()

@property (nonatomic, strong) MEMUserInfo *userInfo;

@end

@implementation MEMUserInfoSyncClient

- (void)syncUserInfo:(MEMUserInfo *)userInfo
{
    self.userInfo = userInfo;
    [self performSelector:@selector(syncComplete) withObject:self afterDelay:1.0f];
}

- (void)syncComplete
{
    [self.delegate syncClient:self didSyncUserInfo:self.userInfo];
}

@end
