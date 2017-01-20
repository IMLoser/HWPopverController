//
//  HWTableViewCell.m
//  自定义下拉菜单
//
//  Created by 曹航玮 on 2017/1/20.
//  Copyright © 2017年 曹航玮. All rights reserved.
//

#import "HWTableViewCell.h"

@implementation HWTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleBlue;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
