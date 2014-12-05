//
//  YFProgressView.m
//  YFProgressVIew
//
//  Created by HuangYiFeng on 11/28/14.
//  Copyright (c) 2014 hyf. All rights reserved.
//

#import "YFProgressView.h"

@interface YFProgressView ()

//Model
@property(nonatomic, assign)BOOL  isScrolling;

//View
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

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self initViewComponent];
    }
    return self;
}


#pragma mark - init

- (void)initViewComponent
{
    self.trackBar = [[UIView alloc] init];
    self.trackBar.clipsToBounds = YES;
//    self.trackBar.backgroundColor = [UIColor redColor];
    
    self.progressBar = [[UIView alloc] init];
    self.progressBar.backgroundColor = [UIColor blueColor];
    
    [self addSubview:self.trackBar];
    [self.trackBar addSubview:self.progressBar];
}

#pragma mark - override

- (void)layoutSubviews
{
    self.trackBar.frame = self.bounds;
    
    CGSize containterSize = self.bounds.size;
    if (YFProgressViewScrollStyleDefault == self.scrollStyle)
    {
        self.progressBar.frame = CGRectMake(0, 0, 0, containterSize.height);
    }
    else
    {
        CGFloat width = containterSize.width / 10;
        self.progressBar.frame = CGRectMake(0 - width, 0, width, containterSize.height);
    }
}

#pragma mark - public

- (void)setProgress:(float)progress animated:(BOOL)animated
{
    _progress = MIN(MAX(0, progress), 1);
    
    CGSize containterSize = self.bounds.size;
//    CGAffineTransform scale = CGAffineTransformMakeScale(containterSize.width * _progress, 1);
    CGRect pgrRect = self.progressBar.frame;
    pgrRect.size.width = containterSize.width * _progress;
    
    if (animated)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.progressBar.frame = pgrRect;
        }];
    }
    else
    {
        self.progressBar.frame = pgrRect;
    }
}

- (void)startScroll
{
    if (YFProgressViewScrollStyleUnKnowEnding != self.scrollStyle)
    {
        return;
    }
    CGFloat length = self.bounds.size.width + self.progressBar.bounds.size.width;
    CGAffineTransform move = CGAffineTransformMakeTranslation(length, 0);
    
    UIViewAnimationOptions options = UIViewAnimationOptionRepeat;
    [UIView animateWithDuration:3.0 delay:0 options:options animations:^{
        self.progressBar.transform = move;
    } completion:^(BOOL finished) {
        self.isScrolling = YES;
    }];
}

- (void)stopScroll
{
    self.isScrolling = NO;
    if (YFProgressViewScrollStyleUnKnowEnding != self.scrollStyle)
    {
        return;
    }
    self.progressBar.transform = CGAffineTransformIdentity;
}

#pragma mark - setter & getter

- (void)setProgress:(float)progress
{
    [self setProgress:progress animated:NO];
}

- (void)setScrollStyle:(YFProgressViewScrollStyle)scrollStyle
{
    if (_scrollStyle != scrollStyle)
    {
        _scrollStyle = scrollStyle;
        [self setNeedsLayout];
    }
}

- (void)setTrackBarColor:(UIColor *)trackBarColor
{
    self.trackBar.backgroundColor = trackBarColor;
}

- (UIColor *)trackBarColor
{
    return self.trackBar.backgroundColor;
}

- (void)setProgressBarColor:(UIColor *)progressBarColor
{
    self.progressBar.backgroundColor = progressBarColor;
}

- (UIColor *)progressBarColor
{
    return self.progressBar.backgroundColor;
}

@end
