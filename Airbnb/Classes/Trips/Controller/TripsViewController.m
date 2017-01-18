//
//  TripsViewController.m
//  Airbnb
//
//  Created by hc on 2016/12/20.
//  Copyright © 2016年 hc. All rights reserved.
//

#import "TripsViewController.h"

@interface TripsViewController ()

@end

@implementation TripsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"旅程";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [UILabel labelWithColor:RGB(60, 60, 60) font:FONT(25) textAlignment:NSTextAlignmentCenter numberOfLines:0];
    label.text = @"您的首次\n探索之旅从哪里开始";
    label.frame = CGRectMake(0, 100, kWindowW, 100);
    [self.view addSubview:label];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(kWindowW / 2 - 50, kWindowH / 2 -50, 100, 100)];
    imageV.layer.cornerRadius = 50;
    imageV.layer.masksToBounds = YES;
    imageV.backgroundColor = RGB(65, 131, 121);
    [self.view addSubview:imageV];
    
    UIView *linView = [[UIView alloc] initWithFrame:CGRectMake(kWindowW /2 -0.5, imageV.bottom, 1, kWindowH)];
    linView.backgroundColor = RGB(99, 99, 99);
    [self.view addSubview:linView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
