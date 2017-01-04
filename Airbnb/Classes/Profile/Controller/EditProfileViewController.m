//
//  EditProfileViewController.m
//  Airbnb
//
//  Created by hc on 2016/12/21.
//  Copyright © 2016年 hc. All rights reserved.
//

#import "EditProfileViewController.h"
#import "EditProfileTextCell.h"
#import "EditProfileEditCell.h"
#import "EditProfileLastCell.h"
@interface EditProfileViewController ()
@property (nonatomic,strong) NSArray *topLabelArray;
@property (nonatomic,strong) NSArray *editEextFieldArray;
@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _topLabelArray = @[@"",@"",];
    self.view.backgroundColor = kWhiteColor;
    self.title = @"编辑个人资料";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"Cancel" imageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0) target:self action:@selector(leftDismiss)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"保存" target:self action:@selector(saveEdit)];
    
    [self setupHeader];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"EditProfileTextCell" bundle:nil] forCellReuseIdentifier:@"EditProfileTextCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"EditProfileEditCell" bundle:nil] forCellReuseIdentifier:@"EditProfileEditCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"EditProfileLastCell" bundle:nil] forCellReuseIdentifier:@"EditProfileLastCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
}
- (void)leftDismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)saveEdit {
    NSLog(@"save");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupHeader {
    UIView *head = [[UIView alloc] init];
    head.frame = CGRectMake(0, 0, kWindowW, kWindowH / 3);
    self.tableView.tableHeaderView = head;
    
    UIImageView *headImage = [[UIImageView alloc] initWithFrame:head.bounds];
    headImage.image = [UIImage imageNamed:@"backImage"];
    [head addSubview:headImage];
}

#pragma mark uitableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    } else if (section == 1) {
        return 4;
    } else if (section == 2){
        return 5;
    }  else {
        return 1;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((indexPath.section == 0 && indexPath.row == 2) || (indexPath.section == 2 && indexPath.row == 4)) {
        return 60;
    }
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.section == 0) {
        if (indexPath.row == 2) {
            EditProfileEditCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditProfileEditCell" forIndexPath:indexPath];
            
            cell.leftText.text = @"关于我";
            cell.rightText.text = @"编辑";
            return cell;
        }
        NSArray *arr = @[@"名字",@"姓氏"];
        EditProfileTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditProfileTextCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.topLabel.text = [arr objectAtIndex:indexPath.row];
        cell.editTextField.placeholder = @"请输入...";
        return cell;
    } else if (indexPath.section == 1) {
        if (indexPath.row == 3) {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.textLabel.text = @"电话";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
        NSArray *arr = @[@"性别",@"出生日期",@"电子邮件"];
        EditProfileTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditProfileTextCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.topLabel.text = [arr objectAtIndex:indexPath.row];
        cell.editTextField.placeholder = @"请输入...";
        return cell;
    } else if (indexPath.section == 2){
        if (indexPath.row == 3) {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.textLabel.text = @"语言";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
        if (indexPath.row == 4) {
            EditProfileEditCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditProfileEditCell" forIndexPath:indexPath];
            cell.leftText.text = @"身份证";
            cell.rightText.text = @"提供";
            return cell;

        }
//        if (indexPath.row == 5) {
//            EditProfileEditCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditProfileEditCell" forIndexPath:indexPath];
//            cell.leftText.text = @"商务差旅";
//            cell.rightText.text = @"提供";
//            return cell;
//
//        }
        
        NSArray *arr = @[@"位置",@"学校",@"工作"];
        EditProfileTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditProfileTextCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.topLabel.text = [arr objectAtIndex:indexPath.row];
        cell.editTextField.placeholder = @"请输入...";
        return cell;
    } else {
        EditProfileLastCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditProfileLastCell" forIndexPath:indexPath];
        cell.label1.text = @"工作邮箱";
        cell.label2.text = @"轻松为商务差旅付款，查看适合商务差\n旅的房源。";
        cell.label3.text = @"提供";
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1 || section == 2 || section == 3) {
        UIView *view = [UIView new];
        view.frame = CGRectMake(0, 0, kWindowW, 80);
        view.backgroundColor = kWhiteColor;
        UILabel *text = [UILabel labelWithColor:RGB(55, 55, 55) font:FONT(25) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        text.frame = CGRectMake(15, 20, kWindowW / 2, 60);
        
        [view addSubview:text];
      
        if (section == 1) {
            text.text = @"私人信息";
        }
        if (section == 2) {
            text.text = @"选填内容";
        }
        if (section == 3) {
            text.text = @"商务差旅";
        }
        [view addSubview:text];
       
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(15, 0, kWindowW - 15, 1)];
        line.backgroundColor = kLightGrayColor;
        [view addSubview:line];
        
        return view;
    } else {
        UIView *view = [UIView new];
        view.frame = CGRectMake(0, 0, kWindowW, 80);
        view.backgroundColor = kWhiteColor;
        
        return view;

    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 80;
}

//去掉UItableview headerview黏性
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView)
    {
        CGFloat sectionHeaderHeight = 40;
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y + 64, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}





@end
