//
//  MEMUserInfo.h
//  MemoryProblems
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MEMVoidBlock)();

@interface MEMUserInfo : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, assign) NSInteger currentScore;
@property (nonatomic, assign) BOOL didUpdate;
@property (nonatomic, strong) NSDate *updatedAtDate;
@property (nonatomic, copy) MEMVoidBlock postNetworkRequestUpdateBlock;

@end
