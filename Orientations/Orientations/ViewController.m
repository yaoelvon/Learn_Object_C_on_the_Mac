//
//  ViewController.m
//  Orientations
//
//  Created by 冯尧 on 15/8/12.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//当iOS设备旋转到一个新的方向时，调用下面这个方法。如果这个方法
//的返回值中包含新的方向，那么应用程序就会旋转当前视图，否则就不旋转。
- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait |
            UIInterfaceOrientationMaskLandscapeLeft);
}

@end
