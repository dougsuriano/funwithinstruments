//
//  AppDelegate.m
//  MemoryProblems
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

#import "MEMAppDelegate.h"
#import "MEMMenuViewController.h"

@interface MEMAppDelegate ()

@end

@implementation MEMAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MEMMenuViewController *vc = [[MEMMenuViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = navController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
