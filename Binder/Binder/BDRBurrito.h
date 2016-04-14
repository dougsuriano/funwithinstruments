//
//  BDRBurrito.h
//  Binder
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Binder inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDRBurrito : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *photoName;

+ (instancetype)burritoNamed:(NSString *)name photoName:(NSString *)photo;

@end
