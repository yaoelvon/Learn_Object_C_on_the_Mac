//
//  ViewController.m
//  Restructure
//
//  Created by 冯尧 on 15/8/12.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *actionButton1;
@property (weak, nonatomic) IBOutlet UIButton *actionButton2;
@property (weak, nonatomic) IBOutlet UIButton *actionButton3;
@property (weak, nonatomic) IBOutlet UIButton *actionButton4;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIApplication *app = [UIApplication sharedApplication];
    UIInterfaceOrientation currentOrientation = app.statusBarOrientation;
    [self doLayoutForOrientation:currentOrientation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//按钮的大小（高和宽）以及顶部信息显示框的宽度（20）
static const CGFloat buttonHeight = 40;
static const CGFloat buttonWidth = 120;
static const CGFloat spacing = 20;

- (void)layoutPortrait {
    //获取父视图bound属性，即父视图的尺寸
    CGRect b = self.view.bounds;
    
    //矩形的宽度和高度
    CGFloat contentWidth = CGRectGetWidth(b) - (2 * spacing);
    CGFloat contentHeight = CGRectGetHeight(b) - (4 * spacing) - (2 * buttonHeight);
    
    //根据矩形的宽度和高度，生产矩形的frame(描述矩形在父视图中的位置）
    self.contentView.frame = CGRectMake(spacing, spacing, contentWidth, contentHeight);
    
    //按钮的位置
    CGFloat buttonRow1y = contentHeight + (2 * spacing);
    CGFloat buttonRow2y = buttonRow1y + buttonHeight + spacing;
    
    CGFloat buttonCol1x = spacing;
    CGFloat buttonCol2x = CGRectGetWidth(b) - buttonWidth - spacing;
    
    //生成按钮的frame值
    self.actionButton1.frame = CGRectMake(buttonCol1x, buttonRow1y, buttonWidth, buttonHeight);
    self.actionButton2.frame = CGRectMake(buttonCol2x, buttonRow1y, buttonWidth, buttonHeight);
    
    self.actionButton3.frame = CGRectMake(buttonCol1x, buttonRow2y, buttonWidth, buttonHeight);
    
    self.actionButton4.frame = CGRectMake(buttonCol2x, buttonRow2y, buttonWidth, buttonHeight);
}

- (void)layoutLandscape {
    CGRect b = self.view.bounds;
    
    CGFloat contentWidth = CGRectGetWidth(b) - buttonWidth - (3 * spacing);
    CGFloat contentHeight = CGRectGetHeight(b) - (2 * spacing);
    
    self.contentView.frame = CGRectMake(spacing, spacing, contentWidth, contentHeight);
    
    CGFloat buttonX = CGRectGetWidth(b) - buttonWidth - spacing;
    CGFloat buttonRow1y = spacing;
    CGFloat buttonRow4y = CGRectGetHeight(b) - buttonHeight - spacing;
    
    CGFloat buttonRow2y = buttonRow1y + floor((buttonRow4y - buttonRow1y) * 0.333);
    CGFloat buttonRow3y = buttonRow1y + floor((buttonRow4y - buttonRow1y) * 0.667);
    
    self.actionButton1.frame = CGRectMake(buttonX, buttonRow1y, buttonWidth, buttonHeight);
    self.actionButton2.frame = CGRectMake(buttonX, buttonRow2y, buttonWidth, buttonHeight);
    
    self.actionButton3.frame = CGRectMake(buttonX, buttonRow3y, buttonWidth, buttonHeight);
    
    self.actionButton4.frame = CGRectMake(buttonX, buttonRow4y, buttonWidth, buttonHeight);
}


//将作用权交给另外两个方法
- (void)doLayoutForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        [self layoutPortrait];
    }
    else {
        [self layoutLandscape];
    }
}

//这个方法把新的方向传递给另一个方法。
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self doLayoutForOrientation:toInterfaceOrientation];
}

@end
