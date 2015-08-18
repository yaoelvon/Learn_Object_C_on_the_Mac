//
//  ViewController.m
//  Simple Table
//
//  Created by 冯尧 on 15/8/15.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//声明一个用于放置所要显示数据的数组
@property (copy, nonatomic) NSArray *dwarves;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建一个数据数组，这些数据要在表中显示
    self.dwarves = @[@"Sleepy", @"Sneezy", @"Bashful", @"Happy",
                     @"Doc", @"Grumpy", @"Dopey",
                     @"Thorin", @"Dorin", @"Nori", @"Ori",
                     @"Balin", @"Dwalin", @"Fili", @"Kili",
                     @"Oin", @"Gloin", @"Bifur", @"Bofur",
                     @"Bombur"];
    
    UITableView *tableView = (id)[self.view viewWithTag:1];
    //调整表示图顶部边缘的偏移值，这样初始屏幕就不会影响透明的状态栏。
    UIEdgeInsets contentInset = tableView.contentInset;
    contentInset.top = 20;
    [tableView setContentInset:contentInset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//两个数据源方法
//用来获得指定分区的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dwarves count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:SimpleTableIdentifier];
    }
    
    UIImage *image = [UIImage imageNamed:@"star"];
    cell.imageView.image = image;
    
    cell.textLabel.text = self.dwarves[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:50];
    
    if (indexPath.row < 7) {
        cell.detailTextLabel.text = @"Mr. Disney";
    } else {
        cell.detailTextLabel.text = @"Mr. Tolkien";
    }
    return cell;
}

//委托
//设置缩进级别为每行的行号
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return nil;
    } else {
        return indexPath;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *rowValue = self.dwarves[indexPath.row];
    NSString *message = [[NSString alloc] initWithFormat:@"You selected %@", rowValue];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Row Selected!" message:message delegate:nil cancelButtonTitle:@"Yes I Did" otherButtonTitles:nil];
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//SET ROW HEIGHT
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


@end
