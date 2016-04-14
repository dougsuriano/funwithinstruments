//
//  BDRBurritoMatcher.h
//  Binder
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Binder inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BDRBurrito;

@interface BDRBurritoMatcher : NSObject

+ (instancetype)sharedMatcher;

- (BDRBurrito *)getNextBurrito;

@end
