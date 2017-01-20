//
//  HWPopverController.h
//  自定义下拉菜单
//
//  Created by 曹航玮 on 2017/1/18.
//  Copyright © 2017年 曹航玮. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HWPopverController : UIViewController

typedef struct {
    
    CGFloat arrowHeight;
    CGFloat arrowWidth;
    CGFloat arrowX;
    
}HWArrowRect;

HWArrowRect HWArrowRectMake(CGFloat arrowH, CGFloat arrowW, CGFloat arrowX);

@property (nonatomic, weak) UIView * contentView;

/** 在使用图层绘制菜单时背景颜色(默认黑色半透明) */
@property (strong, nonatomic) UIColor *backgroundColor;

/** 蒙板颜色 */
@property (strong, nonatomic) UIColor *coverViewColor;

/** 设置弹出框视图的位置和尺寸 */
@property (assign, nonatomic) CGRect listViewFrame;

/** 弹框背景与内容视图边框距离 */
@property (assign, nonatomic) CGFloat margin;

/** 菜单弹出动画时长 */
@property (assign, nonatomic) NSTimeInterval animationInterval;

/** 背景箭头尺寸位置 */
@property (assign, nonatomic) HWArrowRect arrowRect;

/** 菜单初始化方法-01 */
+ (instancetype)achievePopverController;

/**
 菜单初始化方法-02
 @param contentController 内部显示内容控制器
 */
+ (instancetype)achievePopverControllerWithContentViewController:(UIViewController *)contentController;

/** 移除菜单 */
- (void)closeMenu;

@end
