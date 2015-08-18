//
//  RootViewController.m
//  Fonts
//
//  Created by 冯尧 on 15/8/16.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import "RootViewController.h"
#import "FavoritesList.h"
#import "FontListViewController.h"

@interface RootViewController ()

@property (copy, nonatomic) NSArray *familyNames;
@property (assign, nonatomic) CGFloat cellPointSize;
@property (strong, nonatomic) FavoritesList *favoritesList;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //从UIFont中获取所有已知字体名称，存入familyNames,然后对结果数组进行排序
    self.familyNames = [[UIFont familyNames]
                        sortedArrayUsingSelector:@selector(compare:)];
    //使用UIFont获取标题处使用的字体
    UIFont *preferredTableViewFont = [UIFont preferredFontForTextStyle:
                                      UIFontTextStyleHeadline];
    //获取字体的尺寸
    self.cellPointSize = preferredTableViewFont.pointSize;
    //获取收藏列表单列
    self.favoritesList = [FavoritesList sharedFavoritesList];
}

//当把一个视图切换到另一个时，需要显示的内容可能也会发生改变。所以我们需要重新加载表视图。
- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

//首先根据已有的字体系列名称查到所有的字体名字，然后获取系列中首个字体的名称。
- (UIFont *)fontForDisplayAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        NSString *familyName = self.familyNames[indexPath.row];
        NSString *fontName = [[UIFont fontNamesForFamilyName:familyName]
                              firstObject];
        return [UIFont fontWithName:fontName size:self.cellPointSize];
    } else {
        return nil;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //返回分区数
    if ([self.favoritesList.favorites count] > 0) {
        return 2;
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //分区中的行数
    if (section == 0) {
        return [self.familyNames count];
    } else {
        return 1;
    }
}

//指定每个分区的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"All Font Families";
    } else {
        return @"My Favorite Fonts";
    }
}


//核心数据源方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *FamilyNameCell = @"FamilyName";
    static NSString *FavoritesCell = @"Favorites";
    UITableViewCell *cell = nil;
    
    //配置表单元
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:FamilyNameCell forIndexPath:indexPath];
        cell.textLabel.font = [self fontForDisplayAtIndexPath:indexPath];
        cell.textLabel.text = self.familyNames[indexPath.row];
        cell.detailTextLabel.text = self.familyNames[indexPath.row];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:FavoritesCell forIndexPath:indexPath];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UIFont *font = [self fontForDisplayAtIndexPath:indexPath];
        return 25 + font.ascender - font.descender;
    } else {
        return tableView.rowHeight;
    }
}


 #pragma mark - Navigation


 //这个方法通过sender（即轻点的UITableViewCell）来判断哪一行被点击，并向segue请求
 //它的destinationViewController，即要显示的FontListViewController实例。
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
     FontListViewController *listVC = segue.destinationViewController;
     
     //根据用户轻点的事字体系列（section为0）还是收藏单元（section为1）直接向
     //新的视图控制器传入一些值。
     if (indexPath.section == 0) {
         NSString *familyName = self.familyNames[indexPath.row];
         listVC.fontNames = [[UIFont fontNamesForFamilyName:familyName]
                             sortedArrayUsingSelector:@selector(compare:)];
         listVC.navigationItem.title = familyName;
         listVC.showsFavorites = NO;
     } else {
         listVC.fontNames = self.favoritesList.favorites;
         listVC.navigationItem.title = @"Favorites";
         listVC.showsFavorites = YES;
     }
 }


@end
