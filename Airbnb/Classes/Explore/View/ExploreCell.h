//
//  ExploreCell.h
//  Airbnb
//
//  Created by hc on 2017/1/14.
//  Copyright © 2017年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExploreCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentNumberLabel;

@end
