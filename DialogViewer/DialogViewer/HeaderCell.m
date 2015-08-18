//
//  HeaderCell.m
//  DialogViewer
//
//  Created by 冯尧 on 15/8/18.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import "HeaderCell.h"

@implementation HeaderCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


 //为标题单元设置颜色和字体，让它有不同的外观。
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.label.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.8 alpha:1.0];
        self.label.textColor = [UIColor blackColor];
    }
    
    return self;
}

+ (UIFont *)defaultFont {
    return [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}

@end
