//
//  MEMRickRollView.m
//  MemoryProblems
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

#import "MEMRickRollView.h"
#import "FLAnimatedImage.h"

@interface MEMRickRollView ()

@property (nonatomic, strong) FLAnimatedImageView *imageView1;
@property (nonatomic, strong) FLAnimatedImageView *imageView2;
@property (nonatomic, strong) FLAnimatedImageView *imageView3;
@property (nonatomic, strong) FLAnimatedImageView *imageView4;
@property (nonatomic, strong) FLAnimatedImageView *imageView5;

@end

@implementation MEMRickRollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _imageView1 = [[FLAnimatedImageView alloc] init];
        _imageView2 = [[FLAnimatedImageView alloc] init];
        _imageView3 = [[FLAnimatedImageView alloc] init];
        _imageView4 = [[FLAnimatedImageView alloc] init];
        _imageView5 = [[FLAnimatedImageView alloc] init];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"rickroll" ofType:@"gif"];
        NSData *rickRollData = [NSData dataWithContentsOfFile:filePath];
        
        FLAnimatedImage *image = [[FLAnimatedImage alloc] initWithAnimatedGIFData:rickRollData];
        
        _imageView1.animatedImage = image;
        _imageView2.animatedImage = image;
        _imageView3.animatedImage = image;
        _imageView4.animatedImage = image;
        _imageView5.animatedImage = image;
        
        [self addSubview:_imageView1];
        [self addSubview:_imageView2];
        [self addSubview:_imageView3];
        [self addSubview:_imageView4];
        [self addSubview:_imageView5];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView1.frame = CGRectMake(0, 0, 200, 200);
    self.imageView2.frame = CGRectMake(50, 200, 200, 200);
    self.imageView3.frame = CGRectMake(250, 400, 200, 200);
    self.imageView4.frame = CGRectMake(366, 400, 200, 200);
    self.imageView5.frame = CGRectMake(75, 90, 200, 200);
    
    [self.delegate rickRollView:self didRickRollUser:YES];
}

@end
