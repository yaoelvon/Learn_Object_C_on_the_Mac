//
//  SwitchViewController.m
//  View Switcher
//
//  Created by 冯尧 on 15/8/12.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import "SwitchViewController.h"

#import "BlueViewController.h"
#import "YellowViewController.h"

@interface SwitchViewController ()
@property (strong, nonatomic) YellowViewController *yellowViewController;
@property (strong, nonatomic) BlueViewController *blueViewController;

@end

@implementation SwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //使用instantiateViewControllerWithIdentifier:方法从
    //根视图控制器所属的分镜中加载BlueViewController实例。
    //为了访问分镜中特定的视图控制器，我们将使用一个字符串来作为
    //标识符（本例中是Blue）。
    //将BlueViewController实例赋给blueViewController属性
    self.blueViewController = [self.storyboard
                               instantiateViewControllerWithIdentifier:
                               @"Blue"];
    //插入蓝色视图，作为根视图的一个子视图。将其插入到索引为0的位置，
    //这将告诉iOS将这个视图放在其他所有视图之后。
    //黄色视图不在这里加载，因为用户可能永远不点击按钮，这样叫做延迟加载，
    //在真正需要黄色视图时再加载它，是一种降低内存开销的常用方式。
    [self.view insertSubview:self.blueViewController.view atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if (!self.blueViewController.view.superview) {
        self.blueViewController = nil;
    }else
    {
        self.yellowViewController = nil;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//空白操作方法
- (IBAction)switchViews:(id)sender
{
    [UIView beginAnimations:@"View Flip" context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //如果该视图没有父视图，则释放它
    if (!self.yellowViewController.view.superview) {
        if (!self.yellowViewController) {
            self.yellowViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Yellow"];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
        [self.blueViewController.view removeFromSuperview];
        [self.view insertSubview:self.yellowViewController.view atIndex:0];
    }
    else {
        if (!self.blueViewController) {
            self.blueViewController = [self.storyboard
                                       instantiateViewControllerWithIdentifier:@"Blue"];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
        [self.yellowViewController.view removeFromSuperview];
        [self.view insertSubview:self.blueViewController.view atIndex:0];
    }
    [UIView commitAnimations];
}

@end
