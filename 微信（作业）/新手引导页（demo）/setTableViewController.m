//
//  setTableViewController.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/11/1.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "setTableViewController.h"
#import "SettingViewController.h"

@interface setTableViewController ()

@end

@implementation setTableViewController



-(instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        //设置当前视图控制器所对应的tabBarItem
        UIImage *image = [UIImage imageNamed:@"tabbar_me"];
        UIImage *selectedImage = [UIImage imageNamed:@"tabbar_meHL"];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:image selectedImage:selectedImage];
        
        self.tabBarItem = tabBarItem;
        
        self.navigationItem.title = @"设置";
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 3;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"MoreMyAlbum"];
         cell.textLabel.text = @"相册";
    }
    else if (indexPath.section == 0 && indexPath.row == 1) {
        cell.imageView.image = [UIImage imageNamed:@"MoreMyFavorites"];
        cell.textLabel.text = @"收藏";
    }
    else if (indexPath.section == 0 && indexPath.row == 2) {
        cell.imageView.image = [UIImage imageNamed:@"MoreMyBankCard"];
        cell.textLabel.text = @"钱包";
    }
    
    else if (indexPath.section == 1 && indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"MoreExpressionShops"];
        cell.textLabel.text = @"表情";
    }
    else if(indexPath.section == 2 && indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"MoreSetting"];
        cell.textLabel.text = @"设置";
    }

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     if (indexPath.section == 0 && indexPath.row == 0) {
         SettingViewController *VC = [[SettingViewController alloc]init];
         [self.navigationController pushViewController:VC animated:YES];
        
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
