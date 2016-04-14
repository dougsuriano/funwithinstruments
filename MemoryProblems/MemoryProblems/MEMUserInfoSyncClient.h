//
//  MEMUserInfoSyncClient.h
//  MemoryProblems
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MEMUserInfoSyncClient, MEMUserInfo;

@protocol MEMUserInfoSyncClientDelegate <NSObject>

- (void)syncClient:(MEMUserInfoSyncClient *)client didSyncUserInfo:(MEMUserInfo *)user;

@end

@interface MEMUserInfoSyncClient : NSObject

@property (nonatomic, weak) id<MEMUserInfoSyncClientDelegate> delegate;

- (void)syncUserInfo:(MEMUserInfo *)userInfo;

@end
