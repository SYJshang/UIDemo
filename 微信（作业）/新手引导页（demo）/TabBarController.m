//
//  TabBarController.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/29.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "TabBarController.h"
#import "TGViewController.h"
#import "FriendViewController.h"
#import "SetViewController.h"
#import "setTableViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController
#define QYScreenH [UIScreen mainScreen].bounds.size.height
#define QYScreenW [UIScreen mainScreen].bounds.size.width



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViewControl];
    [self setTabBar];
//    self.view.backgroundColor = [UIColor redColor];
    }

- (void)setViewControl
{
    TGViewController *tgVC = [[TGViewController alloc]init];
    
    UINavigationController *nation = [[UINavigationController alloc]initWithRootViewController:tgVC];
    
    FriendViewController *friendVC = [[FriendViewController alloc]init];
    UINavigationController *friendNation = [[UINavigationController alloc]initWithRootViewController:friendVC];
    
    setTableViewController *setVC1 = [[setTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *setNavition = [[UINavigationController alloc]initWithRootViewController:setVC1];
    
    NSArray *VC = @[nation,friendNation,setNavition];
    
    
    self.viewControllers = VC;
    

}

- (void)setTabBar
{
    //1.设置tabBar的背景(tabBar高度49)
    //UIImageView *bgimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, QYScreenH - 49, QYScreenW, 49)];
    //[self.view addSubview:bgimage];
    
    UIImage *image = [UIImage imageNamed:@"tabbarBkg"];
    UIImage *iamgeBackground = [image resizableImageWithCapInsets:UIEdgeInsetsMake(48, 4, 48, 4) resizingMode:UIImageResizingModeStretch];
    //bgimage.image = iamgeBackground;
    
    self.tabBar.backgroundImage = iamgeBackground;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
