//
//  LZMMainViewController.m
//  LZMSideslipController
//
//  Created by Janmy on 17/1/17.
//  Copyright © 2017年 Janmy. All rights reserved.
//

#import "LZMMainViewController.h"

@interface LZMMainViewController ()
{
    UILabel *testLabel;
}
@end

@implementation LZMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    testLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    [testLabel setText:@"这是主页视图"];
    [testLabel setTextAlignment:NSTextAlignmentCenter];
    [testLabel setBackgroundColor:[UIColor redColor]];
    [testLabel setTextColor:[UIColor whiteColor]];
    
    [self.view addSubview:testLabel];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
