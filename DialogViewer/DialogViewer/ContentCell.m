//
//  ContentCell.m
//  DialogViewer
//
//  Created by 冯尧 on 15/8/18.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import "ContentCell.h"

@implementation ContentCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //创建一个标签，设置标签的属性，然后将标签添加到单元的contentView中
        self.label = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        self.label.opaque = NO;
        self.label.backgroundColor = [UIColor colorWithRed:0.8 green:0.9 blue:1.0 alpha:1.0];
        self.label.textColor = [UIColor blackColor];
        
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [[self class] defaultFont];
        [self.contentView addSubview:self.label];
    }
    
    return self;
}

 //定义defaultFont
+ (UIFont *)defaultFont {
    return [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

 //计算表单元的合适尺寸
+ (CGSize)sizeForContentString:(NSString *)s {
    CGSize maxSize = CGSizeMake(300, 1000);
    
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    
    NSDictionary *attributes = @{ NSFontAttributeName : [self defaultFont], NSParagraphStyleAttributeName : style };
    CGRect rect = [s boundingRectWithSize:maxSize options:opts attributes:attributes context:nil];
    
    return rect.size;
}

 //text的获取方法
- (NSString *)text {
    return self.label.text;
}
 //text的设置方法
- (void)setText:(NSString *)text {
    self.label.text = text;
    CGRect newLabelFrame = self.label.frame;
    CGRect newContentFrame = self.contentView.frame;
    CGSize textSize = [[self class] sizeForContentString:text];
    newLabelFrame.size = textSize;
    newContentFrame.size = textSize;
    self.label.frame = newLabelFrame;
    self.contentView.frame = newContentFrame;
}
@end
