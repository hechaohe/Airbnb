//
//  ExperienceCell.m
//  Airbnb
//
//  Created by hc on 2016/12/30.
//  Copyright © 2016年 hc. All rights reserved.
//

#import "ExperienceCell.h"

@implementation ExperienceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"PicCell" bundle:nil] forCellWithReuseIdentifier:@"PicCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"evalueCell" bundle:nil] forCellWithReuseIdentifier:@"evalueCell"];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource =self;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //给cell的标题部分添加手势
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleClicked:)];
    [self.titleText.superview addGestureRecognizer:tapGes];
}
- (void)titleClicked:(UITapGestureRecognizer *)gesture {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedTitleAtRow:)]) {
        [self.delegate didSelectedTitleAtRow:self.row];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

#pragma mark uicollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (!self.dataSource) {
        return 0;
    }
    return [self.dataSource numberOfItemsAtRow:self.row];
}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (!self.dataSource) {
//        return [[UICollectionViewCell alloc] init];
//    }
//    return [self.dataSource collectionView:self.collectionView cellForItemAtIndexPath:indexPath.item atRow:self.row];
//}

@end
