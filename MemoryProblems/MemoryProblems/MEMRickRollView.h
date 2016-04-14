//
//  MEMRickRollView.h
//  MemoryProblems
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MEMRickRollView;

@protocol MEMRickRollViewDelegate <NSObject>

- (void)rickRollView:(MEMRickRollView *)view didRickRollUser:(BOOL)rickroll;

@end

@class FLAnimatedImageView;

@interface MEMRickRollView : UIView

@property (nonatomic, strong, readonly) FLAnimatedImageView *imageView1;
@property (nonatomic, strong, readonly) FLAnimatedImageView *imageView2;
@property (nonatomic, strong, readonly) FLAnimatedImageView *imageView3;
@property (nonatomic, strong, readonly) FLAnimatedImageView *imageView4;
@property (nonatomic, strong, readonly) FLAnimatedImageView *imageView5;
@property (nonatomic, strong) id<MEMRickRollViewDelegate> delegate;

@end
