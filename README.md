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
```

### Effect
![]{https://github.com/IMLoser/HWPopverController/blob/master/HWPopverDemo/自定义下拉菜单/HWPopverController.gif}
