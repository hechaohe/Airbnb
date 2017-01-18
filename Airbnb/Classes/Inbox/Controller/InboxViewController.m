//
//  InboxViewController.m
//  Airbnb
//
//  Created by hc on 2016/12/20.
//  Copyright © 2016年 hc. All rights reserved.
//

#import "InboxViewController.h"
#import "InboxHeaderView.h"
@interface InboxViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) InboxHeaderView *heade;
@end

@implementation InboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = kWhiteColor;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    _heade = [[InboxHeaderView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, 176)];
    
    _heade.hideBtnBlock = ^{
        NSLog(@"hide");

    };
    self.tableView.tableHeaderView = _heade;
}
- (UITableView *)tableView {
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAV_TOP_HEIGHT, kWindowW, kWindowH) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark uitableviewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"number%ld",indexPath.row];
    
    return cell;
}




@end
