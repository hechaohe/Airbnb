//
//  SavedCell.h
//  Airbnb
//
//  Created by hc on 2016/12/29.
//  Copyright © 2016年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SavedCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end
