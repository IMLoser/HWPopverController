# HWPopverController
+ 自定义下拉菜单，创建下拉菜单对象Modal出来即可使用.
+ 无需美工背景图片，利用CAShapeLayer动态绘制菜单背景弹框.
+ 自定义显示内容，提供内容控制器参数.
+ 内含HWArrowRect结构体类型属性，动态改变下拉菜单箭头位置尺寸.

### How to use 
```objc

// 初始化下拉菜单控制器
HWPopverController * popVC = [HWPopverController
                                  achievePopverControllerWithContentViewController:contentViewController];
                                  
// 弹出菜单
[self presentViewController:popVC animated:YES completion:nil];
```
