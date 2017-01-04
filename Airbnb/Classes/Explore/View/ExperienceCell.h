//
//  ExperienceCell.h
//  Airbnb
//
//  Created by hc on 2016/12/30.
//  Copyright © 2016年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PicCell.h"
#import "evalueCell.h"

@class ExperienceCell;
@protocol  ExperienceCellDataSource <NSObject>

- (NSInteger)numberOfItemsAtRow:(NSInteger)row;
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath atRow:(NSInteger)row;
- (CGSize)sizeForItenAtRow:(NSInteger)row;
@end

@protocol ExperienceCellDelegate <NSObject>

//选中cell的标题部分
- (void)didSelectedTitleAtRow:(NSInteger)row;
//选中cell的collectionview的cell
- (void)didSelectedItemInRow:(NSInteger)row atIndex:(NSInteger)index;

@end


@interface ExperienceCell : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UILabel *titleText;
@property (weak, nonatomic) IBOutlet UIButton *allBtn;
@property (weak, nonatomic) IBOutlet UIImageView *litterImg;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,weak) id<ExperienceCellDelegate>delegate;
@property (nonatomic,weak) id <ExperienceCellDataSource> dataSource;
@property (nonatomic,assign) NSInteger row;//记录cell所在的行
@end
