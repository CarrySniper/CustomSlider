//
//  TableViewCell.h
//  自定义提示放大的滑块
//
//  Created by 思久科技 on 2016/11/25.
//  Copyright © 2016年 思久科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumberSlider.h"

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) NumberSlider *slider;

@end
