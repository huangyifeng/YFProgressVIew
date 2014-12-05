//
//  ViewController.m
//  YFProgressVIew
//
//  Created by HuangYiFeng on 11/28/14.
//  Copyright (c) 2014 hyf. All rights reserved.
//

#import "ViewController.h"
#import "YFProgressView.h"

@interface ViewController ()

@property(nonatomic, weak)IBOutlet YFProgressView *defaultProgress;
@property(nonatomic, weak)IBOutlet YFProgressView *scrollProgress;

- (IBAction)startProgress:(id)sender;
- (IBAction)resetProgress:(id)sender;

- (IBAction)startScroll:(id)sender;
- (IBAction)stopScroll:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.defaultProgress.scrollStyle = YFProgressViewScrollStyleDefault;
    self.scrollProgress.scrollStyle = YFProgressViewScrollStyleUnKnowEnding;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (void)startProgress:(id)sender
{
    CGFloat currentProgress = self.defaultProgress.progress;
    currentProgress += 0.1;
    [self.defaultProgress setProgress:currentProgress animated:YES];
}

- (void)resetProgress:(id)sender
{
    [self.defaultProgress setProgress:0 animated:NO];
}

- (void)startScroll:(id)sender
{
    [self.scrollProgress startScroll];
}

- (void)stopScroll:(id)sender
{
    [self.scrollProgress stopScroll];
}

@end
