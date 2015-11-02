//
//  TGTableViewController.h
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/11/1.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGTableViewController : UITableViewController<UISearchResultsUpdating>
//设置搜索的数据源
@property (nonatomic, strong)NSArray *array;
@end
