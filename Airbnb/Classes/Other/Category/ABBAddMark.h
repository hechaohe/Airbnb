//
//  ABBAddMark.h
//  Airbnb
//
//  Created by hc on 2016/12/29.
//  Copyright © 2016年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABBAddMark : UIView

@property (nonatomic,strong,nullable) NSString *title;
@property (nonatomic,strong,nullable) NSString *img;

+ (nonnull instancetype)addMarkWithTitle:(nullable NSString *)title img:(nullable NSString *)img target:(nullable id)target action:(nullable SEL)action;



@end
