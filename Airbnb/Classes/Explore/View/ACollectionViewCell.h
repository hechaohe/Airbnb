//
//  ACollectionViewCell.h
//  Airbnb
//
//  Created by hc on 2017/1/17.
//  Copyright © 2017年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageShow;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@property (nonatomic,strong) NSString *dataString;

@end
