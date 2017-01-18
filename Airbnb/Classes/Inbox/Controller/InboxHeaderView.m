//
//  InboxHeaderView.m
//  Airbnb
//
//  Created by hc on 2017/1/4.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "InboxHeaderView.h"

@implementation InboxHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.headerTable = [[UITableView alloc] initWithFrame:self.frame];
        self.headerTable.delegate =self;
        self.headerTable.dataSource = self;
        [self addSubview:_headerTable];
        self.headerTable.scrollEnabled = NO;
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        view1.backgroundColor = kWhiteColor;
        self.headerTable.tableHeaderView = view1;
        
        UIButton *btn = [UIButton buttonWithType:0];
        [btn setTitle:@"btn" forState:UIControlStateNormal];
        [btn setTitleColor:kBrownColor forState:UIControlStateNormal];
        btn.frame = CGRectMake(20, 10, 50, 30);
        [btn addTarget:self action:@selector(hideBtn) forControlEvents:UIControlEventTouchUpInside];
        [view1 addSubview:btn];
        
        _x = 3;
    }
    return self;
}
- (void)hideBtn {
    !_hideBtnBlock ? : _hideBtnBlock ();
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _x;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"header table");
}

@end
