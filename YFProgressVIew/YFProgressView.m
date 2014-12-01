//
//  YFProgressView.m
//  YFProgressVIew
//
//  Created by HuangYiFeng on 11/28/14.
//  Copyright (c) 2014 hyf. All rights reserved.
//

#import "YFProgressView.h"

@interface YFProgressView ()

@property(nonatomic, strong)UIView *trackBar;
@property(nonatomic, strong)UIView *progressBar;

- (void)initViewComponent;

@end

@implementation YFProgressView

- (instancetype)initWithScrollStyle:(YFProgressViewScrollStyle)scrollStyle
{
    if (self = [super init])
    {
        self.scrollStyle = scrollStyle;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initViewComponent];
    }
    return self;
}


#pragma mark - init

- (void)initViewComponent
{
    self.trackBar = [[UIView alloc] init];
    
    self.progressBar = [[UIView alloc] init];
    
    [self addSubview:self.trackBar];
    [self addSubview:self.progressBar];
}


#pragma mark - override 

- (void)layoutSubviews
{
    self.trackBar.frame = self.bounds;
    
    
    if (YFProgressViewScrollStyleDefault == self.scrollStyle)
    {
        self.progressBar.frame = self.bounds;
    }
    else
    {
        
    }
    
    
}

#pragma mark - public

- (void)setProgress:(float)progress animated:(BOOL)animated
{
    
}

- (void)startScroll
{
    if (YFProgressViewScrollStyleUnKnowEnding != self.scrollStyle)
    {
        return;
    }
    
}

#pragma mark - setter & getter

- (void)setProgress:(float)progress
{
    [self setProgress:progress animated:NO];
}

@end
