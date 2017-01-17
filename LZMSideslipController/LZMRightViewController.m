//
//  LZMRightViewController.m
//  LZMSideslipController
//
//  Created by Janmy on 17/1/17.
//  Copyright © 2017年 Janmy. All rights reserved.
//

#import "LZMRightViewController.h"

@interface LZMRightViewController ()
{
    UILabel *testLabel;
}

@end

@implementation LZMRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    testLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    [testLabel setText:@"这是右视图"];
    [testLabel setTextAlignment:NSTextAlignmentCenter];
    [testLabel setBackgroundColor:[UIColor whiteColor]];
    [testLabel setTextColor:[UIColor blackColor]];
    
    [self.view addSubview:testLabel];
    [self.view setBackgroundColor:[UIColor cyanColor]];
    
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
