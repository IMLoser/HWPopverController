//
//  HWPresentationController.m
//  自定义下拉菜单
//
//  Created by 曹航玮 on 2017/1/18.
//  Copyright © 2017年 曹航玮. All rights reserved.
//

#import "HWPresentationController.h"

@implementation HWPresentationController

- (void)containerViewWillLayoutSubviews
{
    // 蒙板
    UIView * closeView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    closeView.backgroundColor = _coverViewColor;
    [self.containerView insertSubview:closeView atIndex:0];
    
    // 添加手势
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
    [closeView addGestureRecognizer:tapGes];
    
    // 设置弹出框的位置大小
    self.presentedView.frame = _frame;
}

- (void)close
{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
