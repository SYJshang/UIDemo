//
//  FriendTableViewCell.h
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/31.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendModel.h"

@interface FriendTableViewCell : UITableViewCell
@property (nonatomic) BOOL isVip;
@property (strong, nonatomic)FriendModel  *friend;

@end
