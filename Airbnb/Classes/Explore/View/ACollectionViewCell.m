//
//  ACollectionViewCell.m
//  Airbnb
//
//  Created by hc on 2017/1/17.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "ACollectionViewCell.h"

@implementation ACollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setDataString:(NSString *)dataString {
    _dataString = dataString;
    
    NSString *str = [NSString stringWithFormat:@"Airbnb0%@",dataString];
    self.imageShow.image = [UIImage imageNamed:str];
}
@end
