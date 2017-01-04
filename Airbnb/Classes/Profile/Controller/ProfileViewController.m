//
//  ProfileViewController.m
//  Airbnb
//
//  Created by hc on 2016/12/20.
//  Copyright © 2016年 hc. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileCell.h"
#import "ProfileModel.h"
#import "SeeProfileViewController.h"
@interface ProfileViewController ()
@property (nonatomic,strong) NSArray *textArray;
@property (nonatomic,strong) NSArray *imageArray;

@property (nonatomic, strong) UIImageView * topImageView;

@property (nonatomic, assign) CGFloat topContentInset;

@property (nonatomic, assign) CGFloat alphaMemory;

@property (nonatomic, assign) BOOL statusBarStyleControl;

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *blowNameLabel;
@property (nonatomic,strong) UIImageView *headImg;
@end

@implementation ProfileViewController


#pragma mark UITableViewDatasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.textArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileCell"];
    cell.leftLabel.text = [self.textArray objectAtIndex:indexPath.row];
    cell.rightImage.image = [UIImage imageNamed:[self.imageArray objectAtIndex:indexPath.row]];
    return cell;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _statusBarStyleControl = NO;
   
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ProfileCell" bundle:nil] forCellReuseIdentifier:@"ProfileCell"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.textArray = @[@"邀请好友",@"设置",@"帮助与支持",@"为什么要出租",@"发布空间",@"向我们反馈"];
    self.imageArray = @[@"account_invite_24x24_",
                        @"account_internal_settings_24x24_",
                        @"account_help_24x24_",
                        @"account_why_host_24x24_",
                        @"account_lys_24x24_",
                        @"account_feedback_24x24_"];
    
    [self createScaleImageView];
    
    [self createHeadView];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [self setNavigationBarType];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//设置navigationbar为透明
- (void)setNavigationBarType {
    self.navigationController.navigationBar.translucent = YES;
    UIColor *color = [UIColor clearColor];
    CGRect rect = CGRectMake(0, 0, kWindowW, 64);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.clipsToBounds = YES;
}


#pragma mark unopear


- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    NSLog(@"%f",_alphaMemory);
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:_alphaMemory];
    
    
    
    //    [self.navigationItem.leftBarButtonItem setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
    if (_alphaMemory == 0) {
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    }
    else {
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (self.alphaBlock) {
        self.alphaBlock(_alphaMemory);
    }
    
    if (_alphaMemory < 1) {
        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:_alphaMemory];
        [UIView animateWithDuration:0.15 animations:^{
            [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:1];
            
        }];
    }
}



- (void)createScaleImageView
{
    _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW*435.5/414.0)];
    _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, 136)];
    _topImageView.backgroundColor = [UIColor clearColor];
//    _topImageView.image = [UIImage imageNamed:@"backImage"];
    [self.view insertSubview:_topImageView belowSubview:self.tableView];
}

#pragma mark - 创建头像视图
- (void)createHeadView
{
    _topContentInset = 136; //136+64=200
    
    UIView * headBkView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, _topContentInset)];
    headBkView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headBkView;
    
    self.nameLabel = [UILabel labelWithColor:kBlackColor font:[UIFont boldSystemFontOfSize:30] textAlignment:NSTextAlignmentLeft numberOfLines:1];
    self.nameLabel.frame = CGRectMake(15, 44, kWindowW/2, 40);
    self.nameLabel.text = @"Chao";
    [headBkView addSubview:self.nameLabel];
    
    self.blowNameLabel = [UILabel labelWithColor:[UIColor grayColor] font:FONT(18) textAlignment:NSTextAlignmentLeft numberOfLines:1];
    self.blowNameLabel.frame = CGRectMake(15, self.nameLabel.bottom, kWindowW/2, 25);
    self.blowNameLabel.text = @"查看并编辑个人资料";
    [headBkView addSubview:_blowNameLabel];
    
    self.headImg = [[UIImageView alloc] init];
    self.headImg.image = [UIImage imageNamed:@"head"];
    self.headImg.frame = CGRectMake(kWindowW - 70 - 15 , 44, 70, 70);
    self.headImg.layer.cornerRadius = self.headImg.frame.size.width / 2.0;
    self.headImg.layer.masksToBounds = YES;
    [headBkView addSubview:_headImg];
    
    UIButton *viewBtn = [UIButton buttonWithBackgroundColor:kClearColor title:nil titleLabelFont:nil titleColor:nil target:self action:@selector(seeInfo:) clipsToBounds:NO];
    viewBtn.frame = CGRectMake(0, 0, kWindowW, _topContentInset);
    [headBkView addSubview:viewBtn];
}
- (void)seeInfo:(id)sender {
    SeeProfileViewController *seeProVC = [[SeeProfileViewController alloc] init];
    [self.navigationController pushViewController:seeProVC animated:YES];
}
#pragma mark - 设置分割线顶头
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - 滑动代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y + self.tableView.contentInset.top;//注意
    //    NSLog(@"%lf", offsetY);
    
    if (offsetY > _topContentInset && offsetY <= _topContentInset * 2) {
        
        _statusBarStyleControl = YES;
        if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
            [self setNeedsStatusBarAppearanceUpdate];
        }
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
        
        _alphaMemory = offsetY/(_topContentInset * 2) >= 1 ? 1 : offsetY/(_topContentInset * 2);
        
        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:_alphaMemory];
        
    }
    else if (offsetY <= _topContentInset) {
        
        _statusBarStyleControl = NO;
        if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
            [self setNeedsStatusBarAppearanceUpdate];
        }
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        _alphaMemory = 0;
        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
    }
    else if (offsetY > _topContentInset * 2) {
        _alphaMemory = 1;
        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:1];
    }
    
    if (offsetY < 0) {
        _topImageView.transform = CGAffineTransformMakeScale(1 + offsetY/(-500), 1 + offsetY/(-500));
    }
    CGRect frame = _topImageView.frame;
    frame.origin.y = 0;
    _topImageView.frame = frame;
}


#ifdef __IPHONE_7_0
- (UIStatusBarStyle)preferredStatusBarStyle
{
    if (_statusBarStyleControl) {
        return UIStatusBarStyleDefault;
    }
    else {
        return UIStatusBarStyleLightContent;
    }
}
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

#endif





@end
