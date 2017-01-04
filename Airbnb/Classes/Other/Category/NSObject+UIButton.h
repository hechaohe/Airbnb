//
//  NSObject+UIButton.h
//  lvdun
//
//  Created by hc on 16/8/15.
//  Copyright © 2016年 hc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (UIButton)
+ (UIButton *)buttonWithBackgroundColor:(UIColor *)backgroundColor
                                  title:(NSString *)title
                         titleLabelFont:(UIFont *)font
                             titleColor:(UIColor *)titleColor
                                 target:(id)target
                                    action:(SEL)action
                            clipsToBounds:(BOOL)clipsToBounds;

+ (UIButton *)borderButtonWithBackgroundColor:(UIColor *)backgroundColor
                                        title:(NSString *)title
                               titleLabelFont:(UIFont *)font
                                   titleColor:(UIColor *)titleColor
                                       target:(id)target
                                       action:(SEL)action
                                clipsToBounds:(BOOL)clipsToBounds;
@end
