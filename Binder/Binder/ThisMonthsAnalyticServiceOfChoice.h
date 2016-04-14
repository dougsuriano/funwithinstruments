//
//  ThisMonthsAnalyticServiceOfChoice.h
//  Binder
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Binder inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThisMonthsAnalyticServiceOfChoice : NSObject

+ (void)trackEvent:(NSString *)eventName parameters:(NSDictionary *)parameters;

@end
