//
//  TGViewController.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/30.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "TGViewController.h"
#import "TGModel.h"
#import "TGTableViewCell.h"
#import "TGTableViewController.h"
#import "TGWebViewController.h"

@interface TGViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *array;

@property (nonatomic, strong)UISearchController *searchController;
@end

@implementation TGViewController

//初始化 设置tabBar的标题及内容
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //设置当前视图控制器所对应的tabBarItem
        UIImage *image = [UIImage imageNamed:@"tabbar_mainframe"];
        UIImage *selectedImage = [UIImage imageNamed:@"tabbar_mainframeHL"];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"团购" image:image selectedImage:selectedImage];
        
        self.tabBarItem = tabBarItem;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    _tableview = tableView;
    _tableview.dataSource = self;
    _tableview.delegate = self;
    _tableview.rowHeight = 100;
    [self setBarItem];
    [self setRefreshControllWithSeach];
    
}

//设置当前视图控制器所对应的navigationBar
- (void)setBarItem
{
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editAction:)];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(barButtonItemClick:)];
    NSString *title = @"团购";
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    self.navigationItem.title = title;
}

-(void)editAction:(UIBarButtonItem *)barButtonItem
{
    if ([barButtonItem.title isEqualToString:@"编辑"]) {
        [_tableview setEditing:YES animated:YES];
        barButtonItem.title = @"完成";
    }else{
        [_tableview setEditing:NO animated:YES];
        barButtonItem.title = @"编辑";
    }
}
//当点击搜索的时候进入下一个控制器内
- (void)barButtonItemClick:(UIBarButtonItem *)sender
{
    [self presentViewController:_searchController animated:YES completion:nil];
}

- (NSMutableArray *)array
{
    if (_array == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"tgs" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            TGModel *cellModel = [TGModel modelWithDictionary:dict];
            [models addObject:cellModel];
        }
        _array = models;
    }
    return _array;
}



////组的个数
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return self.array.count;
//}

#pragma mark - tableView delegate
//每组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

//每行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idenifer = @"cell";
    TGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifer];
    if (cell == nil) {
        cell = [[TGTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifer];
    }
    TGModel *model = self.array[indexPath.row];
    //cell.model = model;
    cell.buycount.text = model.title;
    cell.price.text = model.price;
    cell.iconImage.image = [UIImage imageNamed:model.icon];
    cell.qyLabel.text = model.buycount;

    
    return cell;
    
}

#pragma mark - 添加头标题
//设置头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIScrollView *scrol = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,375 ,150)];
    [self.view addSubview:scrol];
    
    scrol.contentSize = CGSizeMake(375  * 3, 150);
    scrol.pagingEnabled = YES;
    scrol.showsHorizontalScrollIndicator = NO;
    scrol.showsVerticalScrollIndicator = NO;
    scrol.delegate = self;
    scrol.backgroundColor = [UIColor blackColor];
    
    for (int i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(375 * i, 0, 375, 150)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"meishi%d.jpg",i + 1]];
        [scrol addSubview:imageView];
    }

    return scrol;

}

#pragma mark - 搜索条实现，搜索功能的是实现及下拉刷新
//添加搜索条
- (void)setRefreshControllWithSeach
{
    UIRefreshControl *refresh = [[UIRefreshControl alloc]init];
    [_tableview addSubview:refresh];
    [refresh addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    
    //添加搜索视图控制器
    TGTableViewController *resultVC = [[TGTableViewController alloc] init];
    resultVC.array = self.array;
    _searchController = [[UISearchController alloc] initWithSearchResultsController:resultVC];
    _searchController.hidesNavigationBarDuringPresentation = YES;
    _searchController.dimsBackgroundDuringPresentation = YES;
    //sou suo jie gou
    _searchController.searchResultsUpdater = resultVC;

} 

//下拉刷新
-(void)refresh:(UIRefreshControl *)refresh
{
    [refresh performSelector:@selector(endRefreshing) withObject:nil afterDelay:2];
}

#pragma mark -  设置编辑的事件

//设置头标题的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 150;
}


//设置允许编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}



//设置允许移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//实现编辑
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //更改数据源
    [_array removeObjectAtIndex:indexPath.row];
    
    //更改界面
    NSArray *indexPaths = [NSArray arrayWithObjects:indexPath, nil];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    
    [_tableview reloadData];
}

//实现移动
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    //更改数据源
    TGModel *sourceModel = _array[sourceIndexPath.row];
    [_array removeObjectAtIndex:sourceIndexPath.row];
    [_array insertObject:sourceModel atIndex:destinationIndexPath.row];
    [_tableview reloadData];
}

#pragma mark - 设置行点击事件

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.navigationController.tabBarController setHidesBottomBarWhenPushed:YES];
    TGWebViewController *webVC = [[TGWebViewController alloc] init];
    webVC.urlString = @"http://www.apple.com";
    
    [self.navigationController pushViewController:webVC animated:YES];
    
}



@end
