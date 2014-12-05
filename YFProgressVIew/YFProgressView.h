//
//  YFProgressView.h
//  YFProgressVIew
//
//  Created by HuangYiFeng on 11/28/14.
//  Copyright (c) 2014 hyf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    YFProgressViewScrollStyleDefault,
    YFProgressViewScrollStyleUnKnowEnding,
}YFProgressViewScrollStyle;


@interface YFProgressView : UIView

@property(nonatomic, assign) YFProgressViewScrollStyle  scrollStyle;
@property(nonatomic, assign) float                      progress;
@property(nonatomic, strong) UIColor                    *trackBarColor;
@property(nonatomic, strong) UIColor                    *progressBarColor;

- (instancetype)initWithScrollStyle:(YFProgressViewScrollStyle)scrollStyle;

- (void)setProgress:(float)progress
           animated:(BOOL)animated;

- (void)startScroll;
- (void)stopScroll;

@end
