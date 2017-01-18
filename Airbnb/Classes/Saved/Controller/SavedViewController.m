//
//  SavedViewController.m
//  Airbnb
//
//  Created by hc on 2016/12/20.
//  Copyright © 2016年 hc. All rights reserved.
//

#import "SavedViewController.h"
#import "SavedCell.h"
#import "DetailSavedController.h"
#import "OUNavigationController.h"
@interface SavedViewController () 

@end

@implementation SavedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarType];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SavedCell" bundle:nil] forCellReuseIdentifier:@"SavedCell"];
    UIView *heade = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, 100)];
    self.tableView.tableHeaderView = heade;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 50, kWindowW - 30, 50)];
    label.font = [UIFont boldSystemFontOfSize:45];
    label.text = @"心愿单";
    [heade addSubview:label];
    
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
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

#pragma mark ---uitableViewdatasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SavedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SavedCell" forIndexPath:indexPath];
    cell.pic.image = [UIImage imageNamed:@"001"];
    cell.addressLabel.text = @"linfen";
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld个house",indexPath.row];
    return cell;
}
//  __TVOS_PROHIBITED
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[DetailSavedController alloc] init]];
    nav.modalPresentationStyle = UIModalPresentationPageSheet;
    nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:nav animated:YES completion:nil];
    
    
}





@end
