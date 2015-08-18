//
//  FontListViewController.h
//  Fonts
//
//  Created by 冯尧 on 15/8/17.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontListViewController : UITableViewController

@property (copy, nonatomic) NSArray *fontNames;
@property (assign, nonatomic) BOOL showsFavorites;

@end
