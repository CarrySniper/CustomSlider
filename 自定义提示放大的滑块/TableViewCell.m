//
//  TableViewCell.m
//  自定义提示放大的滑块
//
//  Created by 思久科技 on 2016/11/25.
//  Copyright © 2016年 思久科技. All rights reserved.
//

#import "TableViewCell.h"

#define DeviceWidth    ([UIScreen mainScreen].bounds.size.width)

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 生成的图片ThumbImage大小为：30*30，所以这里的高度要设同样的高度30
        self.slider = [[NumberSlider alloc]init];
        self.slider.frame = CGRectMake(16, (44-30)/2.0, DeviceWidth - 32, 30);
        [self.contentView addSubview:self.slider];
        
        self.slider.minimumValue = 0;
        self.slider.maximumValue = 998;
        
        [self.slider setValue:168 animated:YES];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.imageView removeFromSuperview];
    [self.textLabel removeFromSuperview];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
