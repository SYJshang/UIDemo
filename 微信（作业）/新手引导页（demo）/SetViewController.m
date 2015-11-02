//
//  SetViewController.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/30.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "SetViewController.h"

@interface SetViewController ()

@end

@implementation SetViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //设置当前视图控制器所对应的tabBarItem
        UIImage *image = [UIImage imageNamed:@"tabbar_me"];
        UIImage *selectedImage = [UIImage imageNamed:@"tabbar_meHL"];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:image selectedImage:selectedImage];
        
        self.tabBarItem = tabBarItem;
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationItem.title = @"设置";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
