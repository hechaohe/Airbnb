//
//  UILabel+Extension.m
//  LawProtect
//
//  Created by hc on 16/9/5.
//  Copyright © 2016年 hc. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)
- (void)setAttributeTextWithString:(NSString *)string range:(NSRange)range {
    NSMutableAttributedString *attrsString = [[NSMutableAttributedString alloc] initWithString:string];
    [attrsString addAttribute:NSForegroundColorAttributeName value:kOrangeColor range:range];
    self.attributedText = attrsString;
}

@end
