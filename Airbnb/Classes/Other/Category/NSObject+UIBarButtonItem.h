//
//  NSObject+UIBarButtonItem.h
//  lvdun
//
//  Created by hc on 16/8/16.
//  Copyright © 2016年 hc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (UIBarButtonItem)
+ (instancetype)leftBarButtonItemWithImageName:(NSString *)imageName
                                        target:(id)target
                                        action:(SEL)action;
//rightBarButtonItem with image
+ (instancetype)rightBarButtonItemWithImageName:(NSString *)imageName
                                         target:(id)target
                                         action:(SEL)action;
//rightBarButtonItem with title
+ (instancetype)rightBarbuttonItemWithTitle:(NSString *)title
                                     target:(id)target
                                     action:(SEL)action;
+ (instancetype)barButtonItemWithImageName:(NSString *)imageName
                           imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
                                    target:(id)target
                                    action:(SEL)action;


+ (instancetype)barButtonItemWithTitle:(NSString *)title
                                target:(id)target
                                action:(SEL)action;
+ (instancetype)barButtonItemWithTitle:(NSString *)title
                         selectedTitle:(NSString *)selTitle
                                target:(id)target
                                action:(SEL)action;
//白色
+ (instancetype)whiteBarButtonItemWithTitle:(NSString *)title
                                target:(id)target
                                action:(SEL)action;
@end
