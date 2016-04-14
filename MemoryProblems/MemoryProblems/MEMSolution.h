//
//  MEMSolution.h
//  MemoryProblems
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEMSolution : NSObject

@property (nonatomic, strong) NSData *data;

- (instancetype)initWithData:(NSData *)data;

@end
