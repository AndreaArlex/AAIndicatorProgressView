//
//  ViewController.m
//  AAIndicatorProgressDemo
//
//  Created by Arlexovincy on 15/3/26.
//  Copyright (c) 2015年 Arlexovincy. All rights reserved.
//

#import "ViewController.h"
#import "AAIndicatorProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AAIndicatorProgressView *progressView = [[AAIndicatorProgressView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) backColor:[UIColor grayColor] progressColor:[UIColor blueColor] lineWidth:10 isClockWise:NO];
    progressView.precent = 0.6;
    progressView.precentLabel.text = @"60%";
    [self.view addSubview:progressView];
    
    progressView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[progressView(100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(progressView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[progressView(100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(progressView)]];
    [self.view layoutIfNeeded];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
