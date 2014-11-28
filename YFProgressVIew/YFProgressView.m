//
//  YFProgressView.m
//  YFProgressVIew
//
//  Created by HuangYiFeng on 11/28/14.
//  Copyright (c) 2014 hyf. All rights reserved.
//

#import "YFProgressView.h"

@interface YFProgressView ()

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

#pragma mark - public

- (void)setProgress:(float)progress animated:(BOOL)animated
{
    
}

#pragma mark - setter & getter

- (void)setProgress:(float)progress
{
    [self setProgress:progress animated:NO];
}

@end
