//
//  BDRBurrito.m
//  Binder
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Binder inc. All rights reserved.
//

#import "BDRBurrito.h"

@implementation BDRBurrito

+ (instancetype)burritoNamed:(NSString *)name photoName:(NSString *)photo
{
    BDRBurrito *burrito = [BDRBurrito new];
    burrito.name = name;
    burrito.photoName = photo;
    return burrito;
}


@end
