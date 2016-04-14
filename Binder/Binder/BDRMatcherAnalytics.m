//
//  BDRMatcherAnalytics.m
//  Binder
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Binder inc. All rights reserved.
//

#import "BDRMatcherAnalytics.h"
#import "ThisMonthsAnalyticServiceOfChoice.h"
#import "analytic_provider.h"

@implementation BDRMatcherAnalytics

+ (instancetype)sharedAnalytics
{
    static dispatch_once_t onceToken;
    static BDRMatcherAnalytics *_sharedAnalytics = nil;
    dispatch_once(&onceToken, ^{
        _sharedAnalytics = [[BDRMatcherAnalytics alloc] init];
    });
    
    return _sharedAnalytics;
}

- (void)trackEventName:(NSString *)eventName params:(NSDictionary *)params
{
    [ThisMonthsAnalyticServiceOfChoice trackEvent:eventName parameters:params];
    
    if (ANALYTICS_TRACK_ANALYTIC_CALL_ENABLED())
    {
        ANALYTICS_TRACK_ANALYTIC_CALL(eventName.UTF8String, (int)params.allKeys.count);
    }
}

@end
