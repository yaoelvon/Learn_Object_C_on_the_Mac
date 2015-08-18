//
//  NameAndColorCell.m
//  Cells
//
//  Created by 冯尧 on 15/8/15.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import "NameAndColorCell.h"

@interface NameAndColorCell ()

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *colorLabel;

@end

@implementation NameAndColorCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setName:(NSString *)n
{
    if (![n isEqualToString:_name]) {
        _name = [n copy];
        self.nameLabel.text = _name;
    }
}

- (void)setColor:(NSString *)c
{
    if (![c isEqualToString:_color]) {
        _color = [c copy];
        self.colorLabel.text = _color;
    }
}

@end
