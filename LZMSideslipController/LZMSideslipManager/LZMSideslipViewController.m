//
//  LZMSideslipViewController.m
//  LZMSideslipController
//
//  Created by Janmy on 17/1/17.
//  Copyright © 2017年 Janmy. All rights reserved.
//

#import "LZMSideslipViewController.h"
#import "UIView+Rect.h"

@interface LZMSideslipViewController ()

@end

@implementation LZMSideslipViewController

#pragma mark - init 初始化



- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        
        
    }
    
    return self;
    
}



- (instancetype)initWithLeftVC:(UIViewController*)leftVC

                        MainVC:(UIViewController*)mainVC

                       rightVC:(UIViewController*)rightVC

                      andScale:(CGFloat)scale{
    
    if (self) {
        [self.view setBackgroundColor:[UIColor clearColor]];
        _screenWidth = [UIScreen mainScreen].bounds.size.width;
        
        _screenHeight = [UIScreen mainScreen].bounds.size.height;
        _allowLeftSideslip = YES;
        _allowRightSideslip = YES;
        
        
        
        _leftVC = leftVC;
        
        _mainVC = mainVC;
        
        _rightVC = rightVC;
        
        
        //左右视图缩进比例
        
        self.slideViewScale = scale;
        
        [_leftVC.view setFrame:CGRectMake(_screenWidth*(1-self.slideViewScale), 0,_screenWidth*self.slideViewScale,_screenHeight)];
        [_leftVC.view setCenterX:-_screenWidth*(self.slideViewScale/2)];
        
        
        [_rightVC.view setFrame:CGRectMake(0, 0,_screenWidth*self.slideViewScale,_screenHeight)];
        [_rightVC.view setCenterX:_screenWidth*(1+self.slideViewScale/2)];
        
        //渐变效果
        [_rightVC.view setAlpha:0.5];
        [_leftVC.view setAlpha:0.5];
        [_mainVC.view setAlpha:1.0];
        _rightVC.view.hidden = YES;
        _leftVC.view.hidden = YES;
        
        _pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        
        
        
        
        
        [self.view addGestureRecognizer:_pan];
        
        [self.view addGestureRecognizer:_tap];
        
        
        
        [self.view addSubview:leftVC.view];
        
        [self.view addSubview:mainVC.view];
        
        [self.view addSubview:rightVC.view];
        
        
        
    }
    
    
    
    return self;
    
}

#pragma mark - GestureRecognizer Action 手势响应



- (void)panAction:(UIPanGestureRecognizer*)sender{
    
    
    
    //location
    
    CGPoint point = [sender translationInView:self.view];
    
    //    NSLog(@"===pointX:%f",point.x);
    
    if (point.x >= 0 && _allowLeftSideslip && _leftVC.view.centerX<_screenWidth*(self.slideViewScale/2)) {
        
        
        
        //右划
        
        [UIView beginAnimations:nil context:nil];
        
        _mainVC.view.centerX += point.x*0.5;
        
        _leftVC.view.centerX += point.x*0.5;
        
        _rightVC.view.centerX += point.x*0.5;
        
        if (_currentVC == _rightVC) {
            _rightVC.view.alpha = (_screenWidth*0.5-_mainVC.view.centerX)/(_screenWidth*self.slideViewScale);
            _mainVC.view.alpha = 1.5-_rightVC.view.alpha;
        }else{
            _leftVC.view.hidden = NO;
            _leftVC.view.alpha = (_mainVC.view.centerX-_screenWidth/2)/(_screenWidth*self.slideViewScale);
            _mainVC.view.alpha = 1.5-_leftVC.view.alpha;
        }
        [sender setTranslation:CGPointMake(0, 0) inView:self.view];
        
        [UIView commitAnimations];
        
        
        
    }else if(point.x<0 && _allowRightSideslip && _rightVC.view.centerX > _screenWidth*(1-self.slideViewScale/2)){
        
        //左划
        
        [UIView beginAnimations:nil context:nil];
        
        _mainVC.view.centerX += point.x*0.5;
        
        _leftVC.view.centerX += point.x*0.5;
        
        _rightVC.view.centerX += point.x*0.5;
        
        if (_currentVC == _leftVC) {
            _leftVC.view.alpha = (_mainVC.view.centerX-_screenWidth/2)/(_screenWidth*self.slideViewScale);
            _mainVC.view.alpha = 1.5-_leftVC.view.alpha;
        }else{
            _rightVC.view.hidden = NO;
            _rightVC.view.alpha = (_screenWidth*0.5-_mainVC.view.centerX)/(_screenWidth*self.slideViewScale);
            _mainVC.view.alpha = 1.5-_rightVC.view.alpha;
        }
        
        [sender setTranslation:CGPointMake(0, 0) inView:self.view];
        
        [UIView commitAnimations];
        
        
    }
    //    NSLog(@"===before:%f===%f===%f===",_mainVC.view.alpha,_screenWidth*0.5-_mainVC.view.centerX,_screenWidth*self.slideViewScale);
    //透明度优化(这里主视图alpha有个小BUG，一直无法解决，一样的代码，得出的alpha会一次正确一次错误。所以暂时采取在下方多执行一次获取alpha代码来进行矫正)
    if (_leftVC.view.alpha>0 && _allowLeftSideslip && _leftVC.view.centerX<_screenWidth*(self.slideViewScale/2)) {
        _leftVC.view.alpha = (_mainVC.view.centerX-_screenWidth/2)/(_screenWidth*self.slideViewScale);
        _mainVC.view.alpha = 1.5-_leftVC.view.alpha;
    }else if(_rightVC.view.alpha>0 && _allowRightSideslip && _rightVC.view.centerX > _screenWidth*(1-self.slideViewScale/2)){
        _rightVC.view.alpha = (_screenWidth/2-_mainVC.view.centerX)/(_screenWidth*self.slideViewScale);
        _mainVC.view.alpha = 1.5-_rightVC.view.alpha;
    }
    
    //    NSLog(@"===PanAlpha:%f===%f===%f===",_mainVC.view.alpha,_screenWidth*0.5-_mainVC.view.centerX,_screenWidth*self.slideViewScale);
    
    
    
    
    
    
    
    //显示左右主视图的各种情况。
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        
        
        if (_currentVC == _leftVC) {
            
            
            
            if (_screenWidth*(0.5+self.slideViewScale) - _mainVC.view.centerX < _screenWidth*0.1) {
                
                [self showLeftView];
                
                
                
            }else{
                
                [self showMainView];
                
            }
            
            
            
        }else if(_currentVC == _rightVC){
            
            
            
            if (_mainVC.view.centerX - _screenWidth*(0.5-self.slideViewScale) <= _screenWidth*0.1) {
                
                [self showRightView];
                
                
                
            }else{
                
                
                
                [self showMainView];
                
            }
            
            
            
        }else{
            
            
            
            if (_mainVC.view.centerX >= _screenWidth*0.6) {
                
                [self showLeftView];
                
                
                
            }else if(_mainVC.view.centerX <= _screenWidth * 0.4){
                
                [self showRightView];
                
                
                
            }else{
                
                [self showMainView];
                
            }
            
            
            
            
            
        }
        
        
        
    }
    
    
    
}

- (void)tapAction:(UITapGestureRecognizer*)sender{
    CGPoint location = [sender locationInView:self.view];
    if ((_currentVC == _leftVC && location.x>_screenWidth*self.slideViewScale) || (_currentVC == _rightVC && location.x<_screenWidth*(1-self.slideViewScale))) {
        [self showMainView];
    }
    
    
}



#pragma mark - slideResult  侧滑



- (void)showLeftView{
    _currentVC = _leftVC;
    
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionTransitionNone animations:^{
        [_mainVC.view setCenterX:_screenWidth*(0.5+self.slideViewScale)];
        
        [_leftVC.view setCenterX:_screenWidth*self.slideViewScale/2];
        
        [_rightVC.view setCenterX:_screenWidth*(_mainVC.view.centerX+1)];
        
        _leftVC.view.alpha = 1.0;
        _mainVC.view.alpha = 0.5;
    } completion:^(BOOL finished) {
        _rightVC.view.hidden = YES;
        _leftVC.view.hidden = NO;
        
    }];
    
    
}


- (void)showMainView{
    
    _currentVC = _mainVC;
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionTransitionNone animations:^{
        [_mainVC.view setCenterX:_screenWidth*0.5];
        
        [_leftVC.view setCenterX:-_screenWidth*self.slideViewScale/2];
        
        [_rightVC.view setCenterX:_screenWidth*(1+self.slideViewScale/2)];
        
        _leftVC.view.alpha = 0.5;
        _rightVC.view.alpha = 0.5;
        _mainVC.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        _leftVC.view.hidden = YES;
        _rightVC.view.hidden = YES;
    }];
    
    
    
}



- (void)showRightView{
    
    _currentVC = _rightVC;
    
    
    //    [UIView beginAnimations:nil context:nil];
    //
    //    [_mainVC.view setCenterX:_screenWidth*(0.5-self.slideViewScale)];
    //
    //    [_leftVC.view setCenterX:-_screenWidth*self.slideViewScale/2];
    //
    //    [_rightVC.view setCenterX:_screenWidth*(1-self.slideViewScale/2)];
    //
    //    _rightVC.view.alpha = 1;
    //    _mainVC.view.alpha = 0.5;
    //
    //    [UIView commitAnimations];
    //    _leftVC.view.hidden = YES;
    //    _rightVC.view.hidden = NO;
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionTransitionNone animations:^{
        [_mainVC.view setCenterX:_screenWidth*(0.5-self.slideViewScale)];
        
        [_leftVC.view setCenterX:-_screenWidth*self.slideViewScale/2];
        
        [_rightVC.view setCenterX:_screenWidth*(1-self.slideViewScale/2)];
        
        _rightVC.view.alpha = 1;
        _mainVC.view.alpha = 0.5;
    } completion:^(BOOL finished) {
        _leftVC.view.hidden = YES;
        _rightVC.view.hidden = NO;
    }];
    
}

@end
