//
//  BDRBurritoSelectionViewController.m
//  Binder
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Binder inc. All rights reserved.
//

#import "BDRBurritoSelectionViewController.h"
#import "BDRBurrito.h"
#import "BDRBurritoMatcher.h"
#import "BDRMatcherAnalytics.h"

@interface BDRBurritoSelectionViewController ()

@property (nonatomic, strong) UIImageView *burritoImageView;
@property (nonatomic, strong) UILabel *burritoNameLabel;
@property (nonatomic, strong) UIButton *thumbsUpButton;
@property (nonatomic, strong) UIButton *thumbsDownButton;

@end

@implementation BDRBurritoSelectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Binder";

    [self setupSubviews];

    [self getNextBurrito];
}

- (void)setupSubviews
{
    self.burritoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    [self.view addSubview:self.burritoImageView];

    self.burritoNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 320, self.view.frame.size.width - 40, 30)];
    self.burritoNameLabel.font = [UIFont fontWithName:@"Futura-Medium" size:22.0];
    self.burritoNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.burritoNameLabel];

    self.thumbsUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.thumbsUpButton setImage:[UIImage imageNamed:@"thumbs"] forState:UIControlStateNormal];
    self.thumbsUpButton.frame =CGRectMake(self.view.frame.size.width - 120, 380, 100, 100);
    [self.thumbsUpButton addTarget:self action:@selector(thumbsUpTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.thumbsUpButton];

    self.thumbsDownButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.thumbsDownButton setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    self.thumbsDownButton.frame = CGRectMake(20, 380, 100, 100);
    //
    [self.thumbsDownButton addTarget:self action:@selector(thumbsDownTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.thumbsDownButton];
}

- (void)getNextBurrito
{
    BDRBurrito *burrito = [[BDRBurritoMatcher sharedMatcher] getNextBurrito];
    self.burritoImageView.image = [UIImage imageNamed:burrito.photoName];
    self.burritoNameLabel.text = burrito.name;
    [[BDRMatcherAnalytics sharedAnalytics] trackEventName:@"next_burrito" params:@{@"guac" : @YES}];
}

- (void)thumbsUpTapped:(id)sender
{
    [self getNextBurrito];
    [[BDRMatcherAnalytics sharedAnalytics] trackEventName:@"thumbs_up" params:@{@"guac" : @YES, @"a" : @"1", @"b" : @"7"}];
}

- (void)thumbsDownTapped:(id)sender
{
    [self getNextBurrito];
    [[BDRMatcherAnalytics sharedAnalytics] trackEventName:@"thumbs_up" params:@{@"guac" : @YES, @"a" : @"1", @"b" : @"7", @"bx" : @88, @"dfgdf" : @88}];
}

@end
