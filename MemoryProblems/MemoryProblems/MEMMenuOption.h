//
//  MEMMenuOption.h
//  MemoryProblems
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MEMMenuOptionItem)
{
    MEMMenuOptionItemOrderChickenWings,
    MEMMenuOptionItemGetFreePony
};

@interface MEMMenuOption : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) MEMMenuOptionItem optionItem;

+ (instancetype)itemWithOptionItem:(MEMMenuOptionItem)item;
+ (NSString *)titleForOptionItem:(MEMMenuOptionItem)item;

@end
