//
//  BDRBurritoMatcher.m
//  Binder
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Binder inc. All rights reserved.
//

#import "BDRBurritoMatcher.h"
#import "BDRBurrito.h"

@interface BDRBurritoMatcher ()

@property (nonatomic, copy) NSArray *burritos;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation BDRBurritoMatcher

+ (instancetype)sharedMatcher
{
    static BDRBurritoMatcher *_sharedMatcher;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedMatcher = [BDRBurritoMatcher new];
    });

    return _sharedMatcher;
}

- (instancetype)init
{
    self = [super init];

    if (self)
    {
        _burritos = @[
                [BDRBurrito burritoNamed:@"You Earned it" photoName:@"b1"],
                [BDRBurrito burritoNamed:@"Traditional but fun." photoName:@"b2"],
                [BDRBurrito burritoNamed:@"Let's make memories" photoName:@"b3"],
                [BDRBurrito burritoNamed:@"Always down for an adventure" photoName:@"b4"],
                [BDRBurrito burritoNamed:@"I'm a burrito!" photoName:@"b5"],
                [BDRBurrito burritoNamed:@"It will be our secret" photoName:@"b6"],
                [BDRBurrito burritoNamed:@"Oh yeah" photoName:@"b7"],
                [BDRBurrito burritoNamed:@"Never know what to say here." photoName:@"b8"],
                [BDRBurrito burritoNamed:@"Shy at first" photoName:@"b9"],
                [BDRBurrito burritoNamed:@"World Traveller" photoName:@"b10"],
                [BDRBurrito burritoNamed:@"Let's be BFF" photoName:@"b11"],
                [BDRBurrito burritoNamed:@"The Best" photoName:@"b12"],
                [BDRBurrito burritoNamed:@"Let's dance the night away" photoName:@"b13"],
                [BDRBurrito burritoNamed:@"Love the ocean" photoName:@"b14"],
                [BDRBurrito burritoNamed:@"Are you from the Midwest?" photoName:@"b15"],
                [BDRBurrito burritoNamed:@"I love making new friends" photoName:@"b16"],
                [BDRBurrito burritoNamed:@"Let's make adventures" photoName:@"b17"],
                [BDRBurrito burritoNamed:@"OH HAI" photoName:@"b18"],
                [BDRBurrito burritoNamed:@"Down." photoName:@"b19"],
                [BDRBurrito burritoNamed:@"Sup?" photoName:@"b20"],
                [BDRBurrito burritoNamed:@"Ugh" photoName:@"b21"],
        ];

        _currentIndex = 0;

    }

    return self;
}

- (BDRBurrito *)getNextBurrito
{
    if (self.currentIndex > [self.burritos count] - 1)
    {
        self.currentIndex = 0;
    }

    BDRBurrito *burrito = self.burritos[self.currentIndex];
    self.currentIndex++;
    return burrito;
}


@end
