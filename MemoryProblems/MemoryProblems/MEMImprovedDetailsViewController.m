//
//  MEMImprovedDetailsViewController.m
//  MemoryProblems
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

#import "MEMImprovedDetailsViewController.h"
#import "MEMUserInfo.h"
#import "MEMUserInfoSyncClient.h"
#import "FLAnimatedImage.h"


@interface MEMImprovedDetailsViewController () <MEMUserInfoSyncClientDelegate>

@property (nonatomic, strong) MEMUserInfo *userInfo;
@property (nonatomic, assign) BOOL didSyncUserInfo;
@property (nonatomic, strong) MEMUserInfoSyncClient *syncClient;

@property (nonatomic, strong) UIButton *syncButton;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) FLAnimatedImageView *imageView;

@end

@implementation MEMImprovedDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self createUserInfo];
    [self setupSubviews];
    
    

}

- (void)createUserInfo
{
    MEMUserInfo *userInfo = [MEMUserInfo new];
    __weak MEMImprovedDetailsViewController *weakSelf = self;
    userInfo.postNetworkRequestUpdateBlock = ^{
        weakSelf.didSyncUserInfo = YES;
    };

    self.userInfo = userInfo;
}

- (void)syncClient:(MEMUserInfoSyncClient *)client didSyncUserInfo:(MEMUserInfo *)user
{
    self.activityIndicator.hidden = YES;
    self.imageView.hidden = NO;

    self.userInfo.postNetworkRequestUpdateBlock();
}



























































- (void)setupSubviews
{
    self.view.backgroundColor = [UIColor grayColor];

    self.syncButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.syncButton.backgroundColor = [UIColor blueColor];
    [self.syncButton setTitle:@"Order Pony" forState:UIControlStateNormal];
    [self.syncButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.syncButton.frame = CGRectMake(0.0, 0.0, 200.0, 100.0);
    self.syncButton.center = self.view.center;
    [self.syncButton addTarget:self action:@selector(syncButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.syncButton];

    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityIndicator.frame = CGRectMake(0.0, 0.0, 100.0, 100.0);
    self.activityIndicator.center = self.view.center;
    self.activityIndicator.hidden = YES;
    [self.view addSubview:self.activityIndicator];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"rickroll" ofType:@"gif"];
    NSData *rickRollData = [NSData dataWithContentsOfFile:filePath];
    FLAnimatedImage *image = [[FLAnimatedImage alloc] initWithAnimatedGIFData:rickRollData];

    self.imageView = [[FLAnimatedImageView alloc] init];
    self.imageView.animatedImage = image;
    self.imageView.frame = CGRectMake(0.0, 0.0, 200.0, 200.0);
    self.imageView.center = self.view.center;
    self.imageView.hidden = YES;
    [self.view addSubview:self.imageView];
}

- (void)syncButtonTapped:(id)sender
{
    self.syncButton.hidden = YES;
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    [self.syncClient syncUserInfo:self.userInfo];
}

- (MEMUserInfoSyncClient *)syncClient
{
    if (!_syncClient)
    {
        _syncClient = [MEMUserInfoSyncClient new];
        _syncClient.delegate = self;
    }

    return _syncClient;
}



@end
