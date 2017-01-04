//
//  NSObject+UILabel.m
//  lvdun
//
//  Created by hc on 16/8/15.
//  Copyright © 2016年 hc. All rights reserved.
//

#import "NSObject+UILabel.h"

@implementation NSObject (UILabel)
+ (UILabel *)labelWithColor:(UIColor *)labelColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)lines
{
    UILabel *label = [[UILabel alloc]init];
    label.textColor = labelColor;
    label.font = font;
    label.textAlignment = textAlignment;
    label.numberOfLines = lines;
    return label;
}
+(void)showStats:(NSString *)stats atView:(UIView *)view
{
    UILabel *message = [[UILabel alloc]init];
    message.layer.cornerRadius = 10;
    message.clipsToBounds = YES;
    message.backgroundColor = RGBA(0, 0, 0, 0.8);
    message.numberOfLines = 0;
    message.font = [UIFont systemFontOfSize:15];
    message.textColor = [UIColor lightTextColor];
    message.textAlignment = NSTextAlignmentCenter;
    message.alpha = 0;
    
    message.text = stats;
    
    CGSize size = [stats boundingRectWithSize:CGSizeMake(MAXFLOAT, 50)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]}
                                      context:nil].size;
    message.frame = CGRectMake(0, 0, size.width + 20, size.height + 10);
    message.center = view.center;
    [view addSubview:message];
    
    [UIView animateWithDuration:1.5 animations:^{
        message.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            message.alpha = 0;
        } completion:^(BOOL finished) {
            [message removeFromSuperview];
        }];
    }];
}


@end
