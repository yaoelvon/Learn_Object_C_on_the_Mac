//
//  ViewController.h
//  Button Fun
//
//  Created by 冯尧 on 15/8/10.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//在类的头文件中添加了一个方法声明

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)buttonPressed:(UIButton *)sender;

@end

