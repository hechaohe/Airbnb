//
//  UILabel+Extension.h
//  LawProtect
//
//  Created by hc on 16/9/5.
//  Copyright © 2016年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)


/**
 *  快速设置富文本
 *
 *  @param string 需要设置的字符串
 *  @param range  需要设置的范围（范围文字颜色显示为下厨房橘红色）
 */
- (void)setAttributeTextWithString:(NSString *)string range:(NSRange)range;
@end
