//
//  ProfileViewController.h
//  Airbnb
//
//  Created by hc on 2016/12/20.
//  Copyright © 2016年 hc. All rights reserved.
//

#import "BaseTableViewController.h"

@interface ProfileViewController : BaseTableViewController
typedef void(^AlphaBlock)(CGFloat alpha);
@property (nonatomic, copy) AlphaBlock alphaBlock;
@end
