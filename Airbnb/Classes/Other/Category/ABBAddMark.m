//
//  ABBAddMark.m
//  Airbnb
//
//  Created by hc on 2016/12/29.
//  Copyright © 2016年 hc. All rights reserved.
//

#import "ABBAddMark.h"

@interface ABBAddMark ()
@property (nonatomic,strong) UIImageView *markImg;
@property (nonatomic,strong) UILabel *markLabel;

@end

@implementation ABBAddMark

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _markImg = [[UIImageView alloc] init];
        [self addSubview:_markImg];
        [_markImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        _markLabel = [[UILabel alloc] init];
        _markLabel.font = [UIFont systemFontOfSize:14];
        _markLabel.textColor = kWhiteColor;
        [self addSubview:_markLabel];
        [_markLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(30);
            make.centerY.equalTo(self);
        }];
        self.userInteractionEnabled = YES;
    }
    return self;
}

+ (instancetype)addMarkWithTitle:(NSString *)title img:(NSString *)img target:(id)target action:(SEL)action
{
    ABBAddMark *mark = [[ABBAddMark alloc] init];
    mark.markImg.image = [UIImage imageNamed:img];
    mark.markLabel.text = title;
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [mark addGestureRecognizer:tapGes];
    return mark;
}
- (void)setTitle:(NSString *)title
{
    _title = title;
    self.markLabel.text = title;
}
- (void)setImg:(NSString *)img
{
    _img = img;
    self.markImg.image = [UIImage imageNamed:img];
}

@end
