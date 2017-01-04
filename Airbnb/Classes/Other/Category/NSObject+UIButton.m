//
//  NSObject+UIButton.m
//  lvdun
//
//  Created by hc on 16/8/15.
//  Copyright © 2016年 hc. All rights reserved.
//

#import "NSObject+UIButton.h"

@implementation NSObject (UIButton)

+ (UIButton *)buttonWithBackgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleLabelFont:(UIFont *)font titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action clipsToBounds:(BOOL)clipsToBounds
{
    UIButton *button = [[UIButton alloc]init];
    if (clipsToBounds) button.layer.cornerRadius = 5;
    button.backgroundColor = backgroundColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;

    
}
+ (UIButton *)borderButtonWithBackgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleLabelFont:(UIFont *)font titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action clipsToBounds:(BOOL)clipsToBounds
{
    UIButton *button = [[UIButton alloc]init];
    if (clipsToBounds) button.layer.cornerRadius = 5;
    button.layer.borderWidth = 1.0;
    button.layer.borderColor =  RGB(234, 234, 234).CGColor;
    button.backgroundColor = backgroundColor;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
    
}
@end
