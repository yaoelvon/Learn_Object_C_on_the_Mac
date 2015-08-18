//
//  FontListViewController.m
//  Fonts
//
//  Created by 冯尧 on 15/8/17.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import "FontListViewController.h"
#import "FavoritesList.h"
#import "FontSizesViewController.h"
#import "FontInfoViewController.h"

@interface FontListViewController ()

@property (assign, nonatomic) CGFloat cellPointSize;
@end

@implementation FontListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //获取标题的字体，然后获取标题用的字体大小，使用这个大小为默认
    UIFont *preferredTableViewFont = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.cellPointSize = preferredTableViewFont.pointSize;
    if (self.showsFavorites) {
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
    }
}

- (UIFont *)fontForDisplayAtIndexPath:(NSIndexPath *)indexPath {
    NSString *fontName = self.fontNames[indexPath.row];
    return [UIFont fontWithName:fontName size:self.cellPointSize];
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.showsFavorites) {
        self.fontNames = [FavoritesList sharedFavoritesList].favorites;
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.fontNames count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"FontName";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.font = [self fontForDisplayAtIndexPath:indexPath];
    cell.textLabel.text = self.fontNames[indexPath.row];
    cell.detailTextLabel.text = self.fontNames[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIFont *font = [self fontForDisplayAtIndexPath:indexPath];
    return 25 + font.ascender - font.descender;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return self.showsFavorites;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.showsFavorites) {
        return;
    }
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSString *favorite = self.fontNames[indexPath.row];
        [[FavoritesList sharedFavoritesList] removeFavorite:favorite];
        self.fontNames = [FavoritesList sharedFavoritesList].favorites;
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } 
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    [[FavoritesList sharedFavoritesList] moveItemAtIndex:fromIndexPath.row toIndex:toIndexPath.row];
    self.fontNames = [FavoritesList sharedFavoritesList].favorites;
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    UIFont *font = [self fontForDisplayAtIndexPath:indexPath];
    [segue.destinationViewController navigationItem].title = font.fontName;
    
    if ([segue.identifier isEqualToString:@"ShowFontSizes"]) {
    FontSizesViewController *sizesVC = segue.destinationViewController;
    sizesVC.font = font;
    } else if ([segue.identifier isEqualToString:@"ShowFontInfo"]) {
        FontInfoViewController *infoVC = segue.destinationViewController;
        infoVC.font = font;
        infoVC.favorite = [[FavoritesList sharedFavoritesList].favorites
                           containsObject:font.fontName];
    }
}


@end
