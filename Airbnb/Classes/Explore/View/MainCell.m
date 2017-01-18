//
//  MainCell.m
//  Airbnb
//
//  Created by hc on 2017/1/17.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "MainCell.h"
#import "ACollectionViewCell.h"

@interface MainCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation MainCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    [self.displayCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ACollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"ACollectionViewCell"];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.displayCollectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(250, 250*2/3+44);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.displayCollectionView.backgroundColor = kWhiteColor;
    self.displayCollectionView.showsVerticalScrollIndicator = NO;
    self.displayCollectionView.showsHorizontalScrollIndicator = NO;
    
    self.displayCollectionView.dataSource = self;
    self.displayCollectionView.delegate = self;
    self.displayCollectionView.contentInset = UIEdgeInsetsMake(0, 20, 0, 0);
    
}

- (void)setItems:(NSArray *)items {
    _items = items;
    [self.displayCollectionView reloadData];
}

#pragma mark UICOllectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.delegate respondsToSelector:@selector(collectionViewDidSelectedItemAtIndexPath:collectionView:forCell:)]) {
        [self.delegate collectionViewDidSelectedItemAtIndexPath:indexPath collectionView:collectionView forCell:self];
    }
}
#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (_xx == 1) {
        
    }
    
    ACollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ACollectionViewCell" forIndexPath:indexPath];
    cell.dataString = self.items[indexPath.item];
    NSArray *arr = @[@"中国",@"美国",@"韩国",@"日本",@"加拿大"];
    cell.locationLabel.text = [arr objectAtIndex:indexPath.item];
    return cell;

}

@end
