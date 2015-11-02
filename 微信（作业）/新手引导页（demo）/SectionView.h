//
//  SectionView.h
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/31.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendGroup;
@interface SectionView : UITableViewHeaderFooterView

@property (nonatomic,strong) FriendGroup *friendGroup;
@property (nonatomic,strong)void (^headerViewClick)(void);

+ (instancetype)headerViewWthTableView:(UITableView *)tableView;


@end
