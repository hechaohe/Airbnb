//
//  ExploreViewController.m
//  Airbnb
//
//  Created by hc on 2016/12/20.
//  Copyright © 2016年 hc. All rights reserved.
//

#import "ExploreViewController.h"
#import "ABBAddMark.h"
#import "ExploreTableViewCell.h"
#import "ExploreCell.h"

//next section
#import "MainCell.h"
#import "ACollectionViewCell.h"
@interface ExploreViewController () <UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,ExploreTableViewCellDelegate>
@property (nonatomic,strong) UITableView *tableView;
//记录当前偏移量
@property (nonatomic, assign) CGFloat lastTableViewOffsetY;
@property (nonatomic,strong) UIView *cycleScrollView;

@property (nonatomic, assign) CGFloat topContentInset;
@property (nonatomic, assign) BOOL statusBarStyleControl;
@property (nonatomic, assign) CGFloat alphaMemory;
@property (nonatomic,strong) UIView *bigView;
@property (nonatomic,assign) CGFloat threeBtnHeight;
@property (nonatomic,strong) NSArray *arr;

@property (nonatomic,strong) ABBAddMark *mark1;
@property (nonatomic,strong) ABBAddMark *mark2;
@property (nonatomic,strong) ABBAddMark *mark3;
@property (nonatomic,strong) UIButton *hideBtn;
@property (nonatomic,strong) ABBAddMark *mark4;

/** data */
@property (nonatomic,strong) NSArray *items;


@end

@implementation ExploreViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(65, 131, 121);
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }


    [self setup];
    
    
    
    self.navigationController.navigationBar.hidden = YES;
    
    _threeBtnHeight = 210;
     [self createThreeBtn];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _threeBtnHeight, kWindowW, kWindowH - NAV_TOP_HEIGHT - TABBAR_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    ////
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ExploreTableViewCell" bundle:nil] forCellReuseIdentifier:@"ExploreTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ExploreCell" bundle:nil] forCellReuseIdentifier:@"ExploreCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MainCell" bundle:nil] forCellReuseIdentifier:@"MainCell"];
    
    
    _topContentInset = 136;
    _cycleScrollView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, 50)];
    _cycleScrollView.backgroundColor = RGB(65, 131, 121);
    
     _statusBarStyleControl = NO;
    self.tableView.tableHeaderView = _cycleScrollView;
    
    _arr = @[@"推荐",@"房源",@"体验",@"攻略"];
    for (int i = 0; i<4; i ++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25 +i*50, 0, 50, 50)];
        label.text = [_arr objectAtIndex:i];
        label.font = [UIFont boldSystemFontOfSize:15];
        label.textColor = kWhiteColor;
        [_cycleScrollView addSubview:label];
    }

    
    
}
- (void)createThreeBtn {
    self.bigView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, _threeBtnHeight)];
    self.bigView.backgroundColor = RGB(65, 131, 121);
    [self.view addSubview:_bigView];
    
    _hideBtn = [UIButton buttonWithType:0];
    _hideBtn.frame = CGRectMake(15, 30, 20, 20);
    [_hideBtn setImage:[UIImage imageNamed:@"explore_marquee_hide_17x9_"] forState:UIControlStateNormal];
    [_hideBtn addTarget:self action:@selector(hideExplore) forControlEvents:UIControlEventTouchUpInside];
    [_bigView addSubview:_hideBtn];
    
    _mark1 = [ABBAddMark addMarkWithTitle:@"anywhere" img:@"explore_location_icon_24x24_" target:self action:@selector(markAction)];
    _mark1.frame = CGRectMake(15, 40+20, kWindowW - 30, 40);
    _mark1.alpha = 0.8;
    [_bigView addSubview:_mark1];
    
    _mark2 = [ABBAddMark addMarkWithTitle:@"anytime" img:@"explore_marquee_dates_16x16_" target:self action:@selector(markAction)];
    _mark2.frame = CGRectMake(15, 40+20 + 50, kWindowW / 3, 40);
    [_bigView addSubview:_mark2];
    
    _mark3 = [ABBAddMark addMarkWithTitle:@"anyone" img:@"explore_marquee_guests_16x16_" target:self action:@selector(markAction)];
    _mark3.frame = CGRectMake(15, 40+20 + 100, kWindowW / 3, 40);
    [_bigView addSubview:_mark3];
    
    _mark4 = [ABBAddMark addMarkWithTitle:@"anywhere•anytime•1person" img:@"explore_marquee_search_16x16_" target:self action:@selector(showThreeBtn)];
    _mark4.frame = CGRectMake(15, 20, kWindowW - 30, 40);
    [_bigView addSubview:_mark4];
    _mark4.hidden = YES;
}
- (void)markAction {
    NSLog(@"markAction");
}
- (void)hideExplore {
    NSLog(@"hide");
    [UIView animateWithDuration:0.5 animations:^{
        self.bigView.frame = CGRectMake(0, 0, kWindowW, 64);
        self.tableView.frame = CGRectMake(0, 64, kWindowW, kWindowH - NAV_TOP_HEIGHT - TABBAR_HEIGHT);
        self.hideBtn.hidden = YES;
        
        _mark4.hidden = NO;
        
        
    }];
}
- (void)showThreeBtn {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)setNavStyle {
    UIBarButtonItem *firstItem = [UIBarButtonItem barButtonItemWithTitle:[_arr objectAtIndex:0] target:self action:@selector(barButtonItemAction)];
    UIBarButtonItem *secItem = [UIBarButtonItem barButtonItemWithTitle:[_arr objectAtIndex:1] target:self action:@selector(barButtonItemAction)];
    UIBarButtonItem *thirdItem = [UIBarButtonItem barButtonItemWithTitle:[_arr objectAtIndex:2] target:self action:@selector(barButtonItemAction)];
    UIBarButtonItem *fourItem = [UIBarButtonItem barButtonItemWithTitle:[_arr objectAtIndex:3] target:self action:@selector(barButtonItemAction)];
    self.navigationItem.leftBarButtonItems = @[firstItem,secItem,thirdItem,fourItem];
}

- (void)barButtonItemAction {
    
}
#pragma mark uitableviewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        ExploreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExploreTableViewCell" forIndexPath:indexPath];
        cell.priseLabel.text = @"abcdefghijklmn";
        cell.commentLabel.text = @"opq";
        return cell;
    } else if(indexPath.section == 1){
        ExploreCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExploreCell" forIndexPath:indexPath];
        if (indexPath.row == 0) {
            cell.authorLabel.text = @"橘子";
            cell.likeNumberLabel.text = @"20";
            cell.commentNumberLabel.text = @"100";
        }else if (indexPath.row == 1){
            cell.authorLabel.text = @"苹果姐姐";
            cell.likeNumberLabel.text = @"10";
            cell.commentNumberLabel.text = @"99";
        }else {
            cell.authorLabel.text = @"房东的猫";
            cell.likeNumberLabel.text = @"2500";
            cell.commentNumberLabel.text = @"10000";
        }
        
        return cell;
    } else {
        MainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell" forIndexPath:indexPath];
        cell.items = self.items;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        return cell;
    }

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        [UILabel showStats:[NSString stringWithFormat:@"点击了第%ld列",indexPath.row] atView:self.view];
    }

}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        return 100;
    }
    if (indexPath.section == 1) {
        return 100;
    }

    return 300;
}

#pragma mark ScrollViewDelegate
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
        
        [self setNavStyle];
        self.tableView.frame = CGRectMake(0, 64, kWindowW, kWindowH - NAV_TOP_HEIGHT - TABBAR_HEIGHT);
        self.navigationController.navigationBar.hidden = NO;
    }
    else if (offsetY <= _topContentInset) {
        
        _statusBarStyleControl = NO;
        if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
            [self setNeedsStatusBarAppearanceUpdate];
        }
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        _alphaMemory = 0;
        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
        
        self.tableView.frame = CGRectMake(0, _threeBtnHeight, kWindowW, kWindowH - NAV_TOP_HEIGHT - TABBAR_HEIGHT);
         [self removeNav];
    }
    else if (offsetY > _topContentInset * 2) {
        _alphaMemory = 1;
        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:1];
    }
    
}

- (void)removeNav {
    self.navigationItem.leftBarButtonItems = nil;
}


//根据力度判断滚动效果
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    NSLog(@"======== %lf", velocity.y);
    
    //    if(velocity.y > 3 | velocity.y < -3) {
    if(fabs(velocity.y) > 2) {
        [UILabel showStats:@"好大的劲啊！" atView:self.view];
//        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    else {
//        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [UILabel showStats:@"。。。" atView:self.view];
    }
}

#pragma mark   next Section

#pragma mark    ExploreTableViewCellDelegate
- (void)collectionViewDidSelectedItemAtIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView forCell:(MainCell *)cell {
//    ACollectionViewCell *collectionCell = (ACollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    NSLog(@"dian ji le %ld",indexPath.item);
    [UILabel showStats:[NSString stringWithFormat:@"点击了第%ld个",indexPath.item] atView:self.view];
}


- (void)setup {
//    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainCell class]) bundle:nil] forCellReuseIdentifier:@"MainCell"];
    
    NSMutableArray *arrM = [NSMutableArray array];
    for (int i = 0; i < 5; i ++) {
        NSString *str = [NSString stringWithFormat:@"%@",@(i)];
        [arrM addObject:str];
    }
    
    self.items = [arrM copy];
    [self.tableView reloadData];

}




@end
