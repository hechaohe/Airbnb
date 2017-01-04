//
//  BaseTabBarController.m
//  Airbnb
//
//  Created by hc on 2016/12/20.
//  Copyright © 2016年 hc. All rights reserved.
//

#import "BaseTabBarController.h"
#import "ExploreViewController.h"
#import "SavedViewController.h"
#import "TripsViewController.h"
#import "InboxViewController.h"
#import "ProfileViewController.h"
#import "BaseNavigationController.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

+ (void)initialize
{
    NSMutableDictionary *normalAttrs = [[NSMutableDictionary alloc] init];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    NSMutableDictionary *selectedAttrs = [[NSMutableDictionary alloc] init];
    selectedAttrs[NSFontAttributeName] = normalAttrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = ABThemeColor;
    
    UITabBarItem *apperance = [UITabBarItem appearance];
    [apperance setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [apperance setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)setupChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
//    childController.title = title;
    childController.tabBarItem.title = title;
    [childController.tabBarItem setImage:[UIImage imageNamed:image]];
    [childController.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImage]];
    
    BaseNavigationController *navCon = [[BaseNavigationController alloc] initWithRootViewController:childController];
    navCon.title = title;
    [self addChildViewController:navCon];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildViewController:[[ExploreViewController alloc] init] title:@"搜索" image:@"explore_marquee_search_16x16_" selectedImage:@"explore_marquee_search_16x16_"];
    [self setupChildViewController:[[SavedViewController alloc] init] title:@"心愿单" image:@"explore_marquee_search_16x16_" selectedImage:@""];
    [self setupChildViewController:[[TripsViewController alloc] init] title:@"旅程" image:@"explore_marquee_search_16x16_" selectedImage:@""];
    [self setupChildViewController:[[InboxViewController alloc] init] title:@"收件箱" image:@"explore_marquee_search_16x16_" selectedImage:@""];
    [self setupChildViewController:[[ProfileViewController alloc] init] title:@"个人资料" image:@"explore_marquee_search_16x16_" selectedImage:@""];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
