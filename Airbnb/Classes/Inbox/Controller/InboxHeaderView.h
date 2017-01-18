//
//  InboxHeaderView.h
//  Airbnb
//
//  Created by hc on 2017/1/4.
//  Copyright © 2017年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InboxHeaderView : UIView <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *headerTable;
@property (nonatomic,assign) NSInteger x;
@property (nonatomic,copy) void (^hideBtnBlock)();


@end
