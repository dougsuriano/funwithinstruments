//
//  MEMSolution.m
//  MemoryProblems
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

#import "MEMSolution.h"

@implementation MEMSolution

- (instancetype)initWithData:(NSData *)data
{
    self = [super init];
    
    if (self)
    {
        _data = data;
    }
     
    return self;
}

@end
