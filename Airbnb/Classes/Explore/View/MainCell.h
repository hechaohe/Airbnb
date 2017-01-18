//
//  MainCell.h
//  Airbnb
//
//  Created by hc on 2017/1/17.
//  Copyright © 2017年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MainCell,ACollectionViewCell;
@protocol ExploreTableViewCellDelegate <NSObject>

@optional
- (void)collectionViewDidSelectedItemAtIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView forCell:(MainCell *)cell;

@end








@interface MainCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *viewAllLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *displayCollectionView;

//标识
@property (nonatomic,assign) NSInteger xx;

@property (nonatomic,weak)id<ExploreTableViewCellDelegate> delegate;
@property (nonatomic,strong) NSArray *items;
@end
