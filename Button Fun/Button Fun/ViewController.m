//
//  ViewController.m
//  Button Fun
//
//  Created by 冯尧 on 15/8/10.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController


- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@ button pressed.", title];
    
    NSMutableAttributedString *styledText = [[NSMutableAttributedString alloc]initWithString:plainText];
    
    NSDictionary *attributes =
    @{
      NSFontAttributeName : [UIFont boldSystemFontOfSize:_statusLabel.font.pointSize]
      };
    
    NSRange nameRange = [plainText rangeOfString:title];
    
    [styledText setAttributes:attributes range:nameRange];
    _statusLabel.attributedText = styledText;
}
@end
