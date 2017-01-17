# LZMSideslipManager
一款轻量的多页面管理框架工具，类似QQ的侧滑效果，支持左右侧滑，点击/拖动手势都能操作。
A simply multi-views manager tool based on Objective-C which supports left-right direction slip. 

示例

 ![image](https://github.com/JanmyLo/LZMSideslipManager/blob/master/LZMSideslipController/demo.gif)


使用方法：

    #import "LZMSideslipViewController.h"

    LZMMainViewController *mainVC = [[LZMMainViewController alloc]init];
    LZMLeftViewController *leftVC = [[LZMLeftViewController alloc]init];
    LZMRightViewController *rightVC = [[LZMRightViewController alloc]init];
    CGFloat scale = 0.75;
   
    LZMSideslipViewController *slipVC = [[LZMSideslipViewController alloc]initWithLeftVC:leftVC MainVC:mainVC rightVC:rightVC andScale:scale];
    
    self.window.rootViewController = slipVC;
    
两边侧滑页可根据需求开关：
    
    slipVC.allowRightSideslip = NO;
    //slipVC.allowLeftSideslip = NO;
    
注意：左右视图的界面元素绘制不要放在viewDidLoad中，会造成sideslipeController进行侧滑页面缩放操作无效！



