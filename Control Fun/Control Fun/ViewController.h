//
//  ViewController.h
//  Control Fun
//
//  Created by 冯尧 on 15/8/11.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>

//为了让控制器类充当操作表单的委托对象，控制器类需要遵从UIActionSheetDelegate协议
//下面通过在超类后面的尖括号中添加协议名称来实现。
@interface ViewController : UIViewController <UIActionSheetDelegate>
- (IBAction)textFieldDoneEditing:(id)sender;

@end

