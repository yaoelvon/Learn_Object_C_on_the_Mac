//
//  ContentCell.h
//  DialogViewer
//
//  Created by 冯尧 on 15/8/18.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *label;
@property (copy, nonatomic) NSString *text;

+ (CGSize)sizeForContentString:(NSString *)s;

@end
