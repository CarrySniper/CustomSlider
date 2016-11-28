//
//  TipsView.m
//  自定义提示放大的滑块
//
//  Created by 思久科技 on 2016/11/25.
//  Copyright © 2016年 思久科技. All rights reserved.
//

#import "TipsView.h"

static NSTimer *countTimer;
static int changeCount = -1;

@implementation TipsView

static UILabel *label;
+ (instancetype)instance {
    return [[self alloc] init];
}

- (instancetype)init
{
    static TipsView *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super init];
        
        self.autoresizesSubviews = YES;
        self.frame = CGRectMake(0, 0, 56, 44);
        UIImage *image = [UIImage imageNamed:@"tips_bg"];
        self.layer.contents = (id)image.CGImage;
        
        label = [[UILabel alloc]init];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.frame = CGRectMake(0, 0, 56, 35);
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:20.0];
        label.adjustsFontSizeToFitWidth = YES;
        [self addSubview:label];
        
        countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
        countTimer.fireDate = [NSDate distantFuture];//关闭定时器
    });
    return instance;
}

- (void)showText:(NSString *)text targetView:(UIView *)targetView andX:(CGFloat)x;
{
    label.text = text;
    
    // 计算与window之间位置
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect targetframe = [targetView convertRect:targetView.bounds toView:window];
    
    self.frame = CGRectMake(targetframe.origin.x + x,
                            targetframe.origin.y - self.frame.size.height,
                            self.frame.size.width,
                            self.frame.size.height);
    [[[UIApplication sharedApplication]keyWindow] addSubview:self];
    
    countTimer.fireDate = [NSDate distantPast];//开启定时器
    changeCount = 1.0;
}

- (void)hide {
    countTimer.fireDate = [NSDate distantFuture];//关闭定时器
    [self removeFromSuperview];
}


/**
 *  定时器回调方法
 */
- (void)changeTime
{
    if(changeCount-- <= 0){
        countTimer.fireDate = [NSDate distantFuture];//关闭定时器
        [self removeFromSuperview];
    }
}

@end
