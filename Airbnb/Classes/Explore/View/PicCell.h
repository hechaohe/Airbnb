//
//  PicCell.h
//  Airbnb
//
//  Created by hc on 2016/12/30.
//  Copyright © 2016年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PicCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *detailText;

@end
