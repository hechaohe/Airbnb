//
//  DetailSavedController.m
//  Airbnb
//
//  Created by hc on 2017/1/3.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "DetailSavedController.h"
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define DISTANCE ((SCREEN_WIDTH-3*MORE_BTN_WIDTH)/4)
#define MORE_BTN_WIDTH  85
#define MORE_BTN_HEIGHT 85
#define CHANNEL_BTN_FRAME_POINT     CGPointMake(DISTANCE, -225)
#define CUSTOM_CHANNEL_BTN_FRAME_POINT    CGPointMake(DISTANCE*2+MORE_BTN_WIDTH, -225)
#define FAVORITE_BTN_FRAME_POINT     CGPointMake(DISTANCE*3+MORE_BTN_WIDTH*2, -225)
#define DOWNLOAD_BTN_FRAME_POINT    CGPointMake(DISTANCE, -135)
#define HISTORY_BTN_FRAME_POINT    CGPointMake(DISTANCE*2+MORE_BTN_WIDTH, -135)
#define SETTING_BTN_FRAME_POINT     CGPointMake(DISTANCE*3+MORE_BTN_WIDTH*2, -135)
#define CLOSE_BTN_FRAME_POINT       CGPointMake((SCREEN_WIDTH-50)/2, -50)

#define CHANNEL_BTN_BEGIN_POINT     CGPointMake(DISTANCE+MORE_BTN_WIDTH/2, -225)
#define CUSTOM_CHANNEL_BTN_BEGIN_POINT    CGPointMake(DISTANCE*2+MORE_BTN_WIDTH+MORE_BTN_WIDTH/2, -225)
#define FAVORITE_BTN_BEGIN_POINT     CGPointMake(DISTANCE*3+MORE_BTN_WIDTH*2+MORE_BTN_WIDTH/2, -225)
#define DOWNLOAD_BTN_BEGIN_POINT    CGPointMake(DISTANCE+MORE_BTN_WIDTH/2, -135)
#define HISTORY_BTN_BEGIN_POINT    CGPointMake(DISTANCE*2+MORE_BTN_WIDTH+MORE_BTN_WIDTH/2, -135)
#define SETTING_BTN_BEGIN_POINT     CGPointMake(DISTANCE*3+MORE_BTN_WIDTH*2+MORE_BTN_WIDTH/2, -135)
#define CLOSE_BTN_BEGIN_POINT       CGPointMake((SCREEN_WIDTH-50)/2+25, -50)

#define CHANNEL_BTN_END_POINT     CGPointMake(DISTANCE+MORE_BTN_WIDTH/2, 193)
#define CUSTOM_CHANNEL_BTN_END_POINT    CGPointMake(DISTANCE*2+MORE_BTN_WIDTH+MORE_BTN_WIDTH/2, 193)
#define FAVORITE_BTN_END_POINT     CGPointMake(DISTANCE*3+MORE_BTN_WIDTH*2+MORE_BTN_WIDTH/2, 193)
#define DOWNLOAD_BTN_END_POINT    CGPointMake(DISTANCE+MORE_BTN_WIDTH/2, 286)
#define HISTORY_BTN_END_POINT    CGPointMake(DISTANCE*2+MORE_BTN_WIDTH+MORE_BTN_WIDTH/2, 286)
#define SETTING_BTN_END_POINT     CGPointMake(DISTANCE*3+MORE_BTN_WIDTH*2+MORE_BTN_WIDTH/2, 286)
#define CLOSE_BTN_END_POINT       CGPointMake((SCREEN_WIDTH-50)/2+25, 400)

@interface DetailSavedController ()
@property (nonatomic,strong) UIButton *firstBtn;
@property (nonatomic,strong) UIButton *secondBtn;
@property (nonatomic,strong) UIButton *thirdBtn;
@end

@implementation DetailSavedController
//-(UIButton *)firstBtn {
//    if (!_firstBtn) {
//        _firstBtn = [UIButton buttonWithType:0];
//        _firstBtn.backgroundColor = [UIColor brownColor];
//        [_firstBtn setTitle:@"haha" forState:UIControlStateNormal];
//    }
//    return _firstBtn;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem rightBarbuttonItemWithTitle:@"Dismiss" target:self action:@selector(dismissDetail)];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem leftBarButtonItemWithImageName:@"pop" target:self action:@selector(testPop)];
    
//    self.navigationController.navigationBar.backgroundColor =  [UIColor brownColor];
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
}
- (void)dismissDetail {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)testPop {
  
    NSLog(@"pop");
    
//    _firstBtn.frame = CGRectMake(CUSTOM_CHANNEL_BTN_FRAME_POINT.x,
//                                             CUSTOM_CHANNEL_BTN_FRAME_POINT.y,
//                                             MORE_BTN_WIDTH,
//                                             MORE_BTN_HEIGHT);
    
    _firstBtn = [UIButton buttonWithType:0];
    _firstBtn.backgroundColor = [UIColor brownColor];
    [_firstBtn setTitle:@"haha" forState:UIControlStateNormal];
    _firstBtn.frame = CGRectMake(100,
                                 0,
                                 MORE_BTN_WIDTH,
                                 MORE_BTN_HEIGHT);
    [self.view addSubview:_firstBtn];
    
    
    _secondBtn = [UIButton buttonWithType:0];
    _secondBtn.backgroundColor = [UIColor brownColor];
    [_secondBtn setTitle:@"hehe" forState:UIControlStateNormal];
    _secondBtn.frame = CGRectMake(200,
                                 0,
                                 MORE_BTN_WIDTH,
                                 MORE_BTN_HEIGHT);
    [self.view addSubview:_secondBtn];
    
    
    _thirdBtn = [UIButton buttonWithType:0];
    _thirdBtn.backgroundColor = [UIColor brownColor];
    [_thirdBtn setTitle:@"heihei" forState:UIControlStateNormal];
    _thirdBtn.frame = CGRectMake(300,
                                  0,
                                  MORE_BTN_WIDTH,
                                  MORE_BTN_HEIGHT);
    [self.view addSubview:_thirdBtn];
    
    
    [_firstBtn pop_addAnimation:[self addSpringAnimation:CGPointMake(100, 400) withBounciness:8 withSpeed:1] forKey:@"center"];
    
    [_secondBtn pop_addAnimation:[self addSpringAnimation:CGPointMake(200, 400) withBounciness:10 withSpeed:1] forKey:@"center"];
    
    [self performSelector:@selector(performDelay:) withObject:@{@"obj" : self.thirdBtn,
                                                                @"point" : [NSValue valueWithCGPoint:CGPointMake(300, 400)],
                                                                @"bounciness" : [NSNumber numberWithFloat:8.0],
                                                                @"speed" : [NSNumber numberWithFloat:1.0]} afterDelay:0.2];
    
    
    
}

- (POPSpringAnimation *)addSpringAnimation:(CGPoint)point withBounciness:(CGFloat)bounciness withSpeed:(CGFloat)speed
{
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    anim.toValue = [NSValue valueWithCGPoint:point];
    anim.springBounciness = bounciness;
    anim.springSpeed = speed;
    return anim;
}

- (void)performDelay:(NSDictionary *)dic
{
    UIButton *button = [dic valueForKey:@"obj"];
    CGPoint point = [[dic valueForKey:@"point"] CGPointValue];
    CGFloat bounciness = [[dic valueForKey:@"bounciness"] floatValue];
    CGFloat speed = [[dic valueForKey:@"speed"] floatValue];
    
    [button pop_addAnimation:[self addSpringAnimation:point withBounciness:bounciness withSpeed:speed]
                      forKey:@"center"];
}

@end
