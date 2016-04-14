//
//  MEMMenuOption.m
//  MemoryProblems
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

#import "MEMMenuOption.h"

@implementation MEMMenuOption

+ (instancetype)itemWithOptionItem:(MEMMenuOptionItem)item
{
    MEMMenuOption *option = [MEMMenuOption new];
    option.optionItem = item;
    option.title = [[self class] titleForOptionItem:item];
    return option;
}

+ (NSString *)titleForOptionItem:(MEMMenuOptionItem)item
{
    switch (item)
    {
        case MEMMenuOptionItemOrderChickenWings:
            return @"Order Chicken Wings";
        case MEMMenuOptionItemGetFreePony:
            return @"Get Free Pony";
    }

    return nil;
}

@end
