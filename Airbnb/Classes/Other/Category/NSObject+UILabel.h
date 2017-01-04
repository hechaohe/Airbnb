//
//  NSObject+UILabel.h
//  lvdun
//
//  Created by hc on 16/8/15.
//  Copyright © 2016年 hc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (UILabel)
+(UILabel *)labelWithColor:(UIColor *)labelColor
                      font:(UIFont *)font
             textAlignment:(NSTextAlignment)textAlignment
             numberOfLines:(NSInteger)lines;

+(void) showStats:(NSString *)stats atView:(UIView *)view;


@end
