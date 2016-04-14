//
//  BDRAppDelegate.m
//  Binder
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Binder inc. All rights reserved.
//

#import "BDRAppDelegate.h"
#import "BDRBurritoSelectionViewController.h"

@interface BDRAppDelegate ()

@end

@implementation BDRAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    BDRBurritoSelectionViewController *vc = [[BDRBurritoSelectionViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = navController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
