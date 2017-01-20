//
//  ViewController.m
//  自定义下拉菜单
//
//  Created by 曹航玮 on 2017/1/18.
//  Copyright © 2017年 曹航玮. All rights reserved.
//

#import "ViewController.h"
#import "HWPopverController.h"
#import "HWTestVC.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray * colorArray;

@end


// @"黄色",@"红色",@"灰色",@"橙色",@"白色",@"绿色"
@implementation ViewController

- (NSMutableArray *)colorArray
{
    if (!_colorArray) {
        _colorArray = [NSMutableArray arrayWithObjects:[UIColor yellowColor],[UIColor redColor],[UIColor lightGrayColor],[UIColor orangeColor],[UIColor whiteColor],[UIColor greenColor], nil];
    }
    return _colorArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    // 创建内容视图控制器 自定义
    HWTestVC * testVC = [[HWTestVC alloc] initWithStyle:(UITableViewStylePlain)];
    // 创建下拉菜单控制器
    HWPopverController * popVC = [HWPopverController
                                  achievePopverControllerWithContentViewController:testVC];
    
    // 添加监听点击事件
    __weak typeof(HWPopverController) *tmpVC = popVC;
    testVC.selectedBlock = ^(NSInteger index) {
        
        self.view.backgroundColor = self.colorArray[index];
        
        [tmpVC closeMenu];
    };
    
    
    // 设置下拉菜单背景色
    popVC.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    // 设置内容与背景菜单间距
    popVC.margin = 10;
    // 设置缩放菜单动画时长
    popVC.animationInterval = 0.2;
    // 设置下拉菜单位置尺寸
    popVC.listViewFrame = CGRectMake(100, 100, 100, 200);
    // 设置背景菜单箭头位置
    popVC.arrowRect = HWArrowRectMake(15, 15, 50);
    // 弹出菜单
    [self presentViewController:popVC animated:YES completion:nil];
}

@end
