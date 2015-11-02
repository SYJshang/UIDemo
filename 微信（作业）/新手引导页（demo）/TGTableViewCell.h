//
//  TGTableViewCell.h
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/31.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TGModel;

@interface TGTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *buycount;
@property(nonatomic,strong)UILabel *price;
@property(nonatomic,strong)UIImageView *iconImage;
@property (nonatomic, strong)UILabel *qyLabel;

//@property (nonatomic,strong)TGModel *model;


@end
