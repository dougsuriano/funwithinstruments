//
//  MEMDetailsViewController.m
//  MemoryProblems
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

#import "MEMDetailsViewController.h"
#import "MEMRickRollView.h"

static NSInteger const kNumberOfTimesToRickRollNSMeetup = 7;

@interface MEMDetailsViewController () <MEMRickRollViewDelegate>

@end

@implementation MEMDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Never going to give you up";
    self.view.backgroundColor = [UIColor blackColor];

    [self rickRollUser];
}

- (void)rickRollUser
{
    for (NSInteger i = 0; i < kNumberOfTimesToRickRollNSMeetup; i++)
    {
        // Choose a random X,Y position for the view
        CGFloat randomX = (CGFloat)arc4random_uniform(400);
        CGFloat randomY = (CGFloat)arc4random_uniform(450);
        CGRect rickRollFrame = CGRectMake(randomX, randomY, self.view.frame.size.width, self.view.frame.size.height);

        MEMRickRollView *rickRollView = [[MEMRickRollView alloc] initWithFrame:rickRollFrame];
        rickRollView.delegate = self/* MEMDetailsViewController */;

        [self.view addSubview:rickRollView];
    }
}

- (void)rickRollView:(MEMRickRollView *)view didRickRollUser:(BOOL)rickroll
{
    if (rickroll)
    {
        NSLog(@"lolz");
    }
}

@end
