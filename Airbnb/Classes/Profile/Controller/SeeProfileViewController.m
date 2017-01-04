//
//  SeeProfileViewController.m
//  Airbnb
//
//  Created by hc on 2016/12/21.
//  Copyright © 2016年 hc. All rights reserved.
//

#import "SeeProfileViewController.h"
#import "EditProfileViewController.h"
@interface SeeProfileViewController ()
@property (nonatomic,strong) UIImageView *profileImg;
@property (nonatomic,strong) UILabel *allNameLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UIButton *btn;

@end

@implementation SeeProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiteColor;
    self.profileImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH/3)];
    self.profileImg.image = IMG(@"backImage");
    [self.view addSubview:_profileImg];
    
    self.allNameLabel = [UILabel labelWithColor:kBlackColor font:[UIFont boldSystemFontOfSize:30] textAlignment:NSTextAlignmentLeft numberOfLines:1];
    self.allNameLabel.frame = CGRectMake(15, self.profileImg.bottom + 25, kWindowW/2, 40);
    self.allNameLabel.text = @"Chao He";
    [self.view addSubview:_allNameLabel];
    
    NSDate *date = [NSDate date];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
//    [df setDateFormat:@"MM-yyyy"];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [df setDateFormat:@"MM月YYYY"];
    
    
    
    self.dateLabel = [UILabel labelWithColor:[UIColor grayColor] font:FONT(18) textAlignment:NSTextAlignmentLeft numberOfLines:1];
    self.dateLabel.frame = CGRectMake(15, self.allNameLabel.bottom + 30, kWindowW, 30);
    self.dateLabel.text = [NSString stringWithFormat:@"成为会员时间:%@",[df stringFromDate:date]];
    [self.view addSubview:_dateLabel];
    
    self.btn = [UIButton buttonWithType:0];
    self.btn.frame = CGRectMake(kWindowW - 10 - 40, kWindowH/3 - 20, 40, 40);
    [self.btn setImage:IMG(@"navigation-bar-button-icon-edit_16x16_") forState:UIControlStateNormal];
    self.btn.layer.cornerRadius = 20;
    self.btn.layer.masksToBounds = YES;
    self.btn.layer.borderWidth = 1;
    self.btn.layer.borderColor = RGB(222, 222, 222).CGColor;
    _btn.backgroundColor = kWhiteColor;
    [_btn addTarget:self action:@selector(editProfile:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    
}
- (void)editProfile:(id)sender
{
    EditProfileViewController *editVC = [[EditProfileViewController alloc] init];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:editVC];
    [self presentViewController:navC animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
