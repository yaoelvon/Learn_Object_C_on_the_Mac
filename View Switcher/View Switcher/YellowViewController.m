//
//  YellowViewController.m
//  View Switcher
//
//  Created by 冯尧 on 15/8/12.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import "YellowViewController.h"

@interface YellowViewController ()

@end

@implementation YellowViewController

-(IBAction)yellowButtonPressed {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Yellow View BUtton Pressed"
                          message:@"You pressed the button on the yellow view" delegate:nil cancelButtonTitle:@"Yep, I did." otherButtonTitles:nil];
    [alert show];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
