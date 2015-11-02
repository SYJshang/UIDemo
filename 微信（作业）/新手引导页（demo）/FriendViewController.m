//
//  FriendViewController.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/30.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "FriendViewController.h"
#import "FriendGroup.h"
#import "FriendModel.h"
#import "SectionView.h"
#import "FriendTableViewCell.h"

@interface FriendViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating>
@property (nonatomic ,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *array;
@property (nonatomic,strong)UISearchController *seachControll;
@property (nonatomic)BOOL isSeaching;
@property (nonatomic,strong)NSArray *groups;
@end

@implementation FriendViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //设置当前视图控制器所对应的tabBarItem
        UIImage *image = [UIImage imageNamed:@"tabbar_contacts"];
        UIImage *selectedImage = [UIImage imageNamed:@"tabbar_contactsHL"];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"好友" image:image selectedImage:selectedImage];
        
        self.tabBarItem = tabBarItem;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    //添加tableView到viewcontroll
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //设置导航栏
    [self setBarItem];
    //设置搜索框
    [self setSeachBar];
    [self setArray];
    
    // Do any additional setup after loading the view.
}
//添加search搜索条
//在tableview的headerView上添加搜索框
- (void)setSeachBar
{
    //假如你想要把搜索结果显示在同一个view上,在初始化的时候传nil
    _seachControll = [[UISearchController alloc]initWithSearchResultsController:nil];
    _seachControll.hidesNavigationBarDuringPresentation = YES;
    _seachControll.dimsBackgroundDuringPresentation = NO;
    _seachControll.searchBar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    //设置更新搜索结果的代理为self（非常重要！！！）
    _seachControll.searchResultsUpdater = self;
    self.tableView.tableHeaderView = _seachControll.searchBar;
}

- (void)setBarItem
{
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editAction:)];
    NSString *title = @"通讯录";
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    self.navigationItem.title = title;
}
-(void)editAction:(UIBarButtonItem *)barButtonItem
{
    if ([barButtonItem.title isEqualToString:@"编辑"]) {
        [_tableView setEditing:YES animated:YES];
        barButtonItem.title = @"完成";
    }else{
        [_tableView setEditing:NO animated:YES];
        barButtonItem.title = @"编辑";
    }
}


- (void)setArray
{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        NSArray *group = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *groupModle = [NSMutableArray array];
        for (NSDictionary *dict in group) {
            FriendGroup *friendGroup = [FriendGroup friendGroupWithDictionary:dict];
            [groupModle addObject:friendGroup];
        }
        _array = groupModle;
        _groups = groupModle;
}
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_isSeaching) {
        return 1;
    }else{
        return _array.count;
    }
    
}

//每行行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_isSeaching) {
        return _groups.count;
    }
    FriendGroup *friendGroup = _array[section];
    if (friendGroup.isOpen) {
        return friendGroup.friends.count;
    }
    return 0;
}

//每行单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    FriendModel *friend = nil;
    if (_isSeaching) {
        friend = _groups[indexPath.row];
    }else{
        FriendGroup *friendGroup = _groups[indexPath.section];

        friend = friendGroup.friends[indexPath.row];
    }
    
    
    
    
    cell.imageView.image = [UIImage imageNamed:friend.icon];
    cell.textLabel.text = friend.name;
    cell.detailTextLabel.text = friend.status;
    cell.textLabel.textColor = friend.vip ? [UIColor redColor] : [UIColor blackColor];
    
    return cell;
}

//设置sectionHeaderView的高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (_isSeaching) {
        return 0;
    }
    return 44;
}
//组头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (_isSeaching) {
        return nil;
    }
    SectionView *sectionHeaderView = [SectionView headerViewWthTableView:tableView];
    FriendGroup *fg = self.array[section];
    sectionHeaderView.friendGroup = fg;
    
    sectionHeaderView.headerViewClick = ^(){
        [tableView reloadData];
    };
    
    return sectionHeaderView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//编辑事件

//允许编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return 1;
}

//指定编辑样式，添加
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleInsert;
}

//提交编辑样式
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendTableViewCell *addCell = [[FriendTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    FriendGroup *group = self.array[indexPath.section];
    addCell.friend = group.friends[indexPath.row];
    
    if (addCell.isVip) {
        addCell.textLabel.textColor = [UIColor redColor];
    }
    
    //更改数据源
    [group.friends insertObject:addCell.friend atIndex:indexPath.row + 1];
    
    //更改界面
    NSArray *indexPaths = [NSArray arrayWithObjects:indexPath, nil];
    [_tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    
    [_tableView reloadData];
    
}

//允许移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

//实现移动效果
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    FriendGroup *sourceGroup = self.array[sourceIndexPath.section];
    FriendGroup *desGroup = self.array[destinationIndexPath.section];
    
    
    //更改数据源
    [desGroup.friends insertObject:sourceGroup.friends[sourceIndexPath.row] atIndex:destinationIndexPath.row];
    [sourceGroup.friends removeObjectAtIndex:sourceIndexPath.row];
    
    [_tableView reloadData];
    
}

//实现搜索结果
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *filterStr = searchController.searchBar.text;
    // 如果filteredStr为nil，或者为空字符串@""
    if (!filterStr || filterStr.length == 0) {
        _isSeaching = NO;
        _groups = _array;
    } else {
        _isSeaching = YES;
        
        //拿单元格中name跟搜索框中text进行比较
        //单元格里面的数据对应的是QYFriend ，然后拿friend.name跟text相对比
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name CONTAINS[cd] %@", filterStr];
        
        NSMutableArray *filtedArray = [NSMutableArray array];
        for (FriendGroup *fg in _array) {
            NSArray *array = [fg.friends filteredArrayUsingPredicate:predicate];
            [filtedArray addObjectsFromArray:array];
        }
        _groups = filtedArray;
    }
    
    [self.tableView reloadData];
}




@end
