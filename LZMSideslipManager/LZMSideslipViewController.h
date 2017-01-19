//
//  LZMSideslipViewController.h
//  LZMSideslipController
//
//  Created by Janmy on 17/1/17.
//  Copyright © 2017年 Janmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZMSideslipViewController : UIViewController

{
    
    
    
    UIViewController *_leftVC;
    
    
    
    UIViewController *_mainVC;
    
    
    
    UIViewController *_rightVC;
    
    
    
    UIViewController *_currentVC;
    
    
    
    CGFloat _screenWidth;
    
    CGFloat _screenHeight;
    
    
    
    UISwipeGestureRecognizer *_swipe;
    
    UIPanGestureRecognizer *_pan;
    
    UITapGestureRecognizer *_tap;
    
}



/**
 
 侧滑栏视图控制器初始方法(防QQ)
 
 
 
 @param leftVC  左视图控制器
 
 @param mainVC  主视图控制器
 
 @param rightVC 右视图控制器
 
 @param scale   左右视图缩放比例
 
 
 
 @return 侧滑栏视图控制器
 
 */

- (instancetype)initWithLeftVC:(UIViewController*)leftVC

                        MainVC:(UIViewController*)mainVC

                       rightVC:(UIViewController*)rightVC

                      andScale:(CGFloat)scale;



/**
 
 左右侧滑栏的缩进比例
 
 */

@property (nonatomic,assign) CGFloat slideViewScale;

/**
 开启左侧滑页。默认为YES。
 */
@property (nonatomic,assign) BOOL allowLeftSideslip;

/**
 开启右侧滑页。默认为YES。
 */
@property (nonatomic,assign) BOOL allowRightSideslip;

/**
 视图间跳转切换，用于非手势切换时自行调用。
 */
- (void)showLeftView;
- (void)showMainView;
- (void)showRightView;



@end
