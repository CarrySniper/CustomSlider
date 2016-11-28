//
//  TipsView.h
//  自定义提示放大的滑块
//
//  Created by 思久科技 on 2016/11/25.
//  Copyright © 2016年 思久科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipsView : UIView

/**
 单例初始化

 @return 单例
 */
+ (instancetype)instance;

/**
 显示提示视图

 @param text 文本
 @param targetView 目标视图
 @param x 坐标x
 */
- (void)showText:(NSString *)text targetView:(UIView *)targetView andX:(CGFloat)x;

/**
 隐藏提示视图
 */
- (void)hide;

@end
