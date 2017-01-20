//
//  HWPopverController.m
//  自定义下拉菜单
//
//  Created by 曹航玮 on 2017/1/18.
//  Copyright © 2017年 曹航玮. All rights reserved.
//

#import "HWPopverController.h"
#import "HWPresentationController.h"

@interface HWPopverController ()<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

@property (nonatomic, weak) CAShapeLayer * backgroundLayer;

@end

@implementation HWPopverController

#pragma mark - intail

+ (instancetype)achievePopverController
{
    return [self achievePopverControllerWithContentViewController:nil];
}

+ (instancetype)achievePopverControllerWithContentViewController:(UIViewController *)contentController
{
    HWPopverController *popverController = [[HWPopverController alloc] init];
    [popverController backgroundLayer];
    popverController.transitioningDelegate = popverController;
    popverController.modalPresentationStyle = UIModalPresentationCustom;
    
    if (contentController) {
        popverController.contentView = contentController.view;
        [popverController addChildViewController:contentController];
        [popverController.view addSubview:popverController.contentView];
    }
    
    return popverController;
}

#pragma mark - lazy

- (CAShapeLayer *)backgroundLayer
{
    if (!_backgroundLayer) {
        CAShapeLayer *backgroundLayer = [CAShapeLayer layer];
        _backgroundLayer = backgroundLayer;
        _backgroundLayer.fillColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2].CGColor;
        [self.view.layer addSublayer:_backgroundLayer];
        self.view.layer.masksToBounds = YES;
    }
    return _backgroundLayer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

#pragma mark - settings

HWArrowRect HWArrowRectMake(CGFloat arrowH, CGFloat arrowW, CGFloat arrowX)
{
    return (HWArrowRect){arrowH, arrowW, arrowX};
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    _backgroundColor = backgroundColor;
    self.backgroundLayer.fillColor = _backgroundColor.CGColor;
}

- (void)setListViewFrame:(CGRect)listViewFrame
{
    _listViewFrame = listViewFrame;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self drawBackgroundLayer];
    
    self.contentView.frame = CGRectMake(_margin, _margin + _arrowRect.arrowHeight, self.view.frame.size.width - _margin*2, self.view.frame.size.height - _margin*2 - _arrowRect.arrowHeight);
}

/**
 绘制背景框
 */
- (void)drawBackgroundLayer
{
    // 创建贝塞尔路径
    UIBezierPath *bjPatn = [UIBezierPath bezierPath];
    
    [bjPatn moveToPoint:CGPointMake(0, _arrowRect.arrowHeight)];
    [bjPatn addLineToPoint:CGPointMake(_arrowRect.arrowX - _arrowRect.arrowWidth / 2, _arrowRect.arrowHeight)];
    [bjPatn addLineToPoint:CGPointMake(_arrowRect.arrowX, 0)];
    [bjPatn addLineToPoint:CGPointMake(_arrowRect.arrowX + _arrowRect.arrowWidth / 2, _arrowRect.arrowHeight)];
    [bjPatn addLineToPoint:CGPointMake(self.view.bounds.size.width, _arrowRect.arrowHeight)];
    [bjPatn addLineToPoint:CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height)];
    [bjPatn addLineToPoint:CGPointMake(0, self.view.bounds.size.height)];
    [bjPatn closePath];
    self.backgroundLayer.path = bjPatn.CGPath;
}

#pragma mark - < UIViewControllerTransitioningDelegate >

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    HWPresentationController *presentationController = [[HWPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    
    presentationController.frame = _listViewFrame;
    presentationController.coverViewColor = _coverViewColor;
    
    return presentationController;
}


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self;
}

#pragma mark - < UIViewControllerAnimatedTransitioning >

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0;
}

// 负责弹出/回退样式
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    if (toView) {
        
        [[transitionContext containerView] addSubview:toView];
        
        toView.layer.anchorPoint = CGPointMake(0.5, 0);
        
        toView.transform = CGAffineTransformMakeScale(1, 0);
        
        [UIView animateWithDuration:_animationInterval animations:^{
            
            toView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:YES];
        }];
        
    } else if (fromView) {
        
        [UIView animateWithDuration:_animationInterval animations:^{
            
            fromView.transform = CGAffineTransformMakeScale(1.0, 0.000001);
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:YES];
        }];
        
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}

- (void)closeMenu
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc
{
    NSLog(@"下拉菜单移除");
}

@end
