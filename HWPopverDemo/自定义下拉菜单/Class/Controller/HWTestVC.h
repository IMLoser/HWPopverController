//
//  HWTestVC.h
//  自定义下拉菜单
//
//  Created by 曹航玮 on 2017/1/19.
//  Copyright © 2017年 曹航玮. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^SelectedBlock)(NSInteger index);


@interface HWTestVC : UITableViewController

@property (nonatomic, copy) SelectedBlock selectedBlock;

@end
