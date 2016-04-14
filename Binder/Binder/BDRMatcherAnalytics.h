//
//  BDRMatcherAnalytics.h
//  Binder
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Binder inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDRMatcherAnalytics : NSObject

+ (instancetype)sharedAnalytics;

- (void)trackEventName:(NSString *)eventName params:(NSDictionary *)params;

@end
