//
//  TGTableViewCell.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/31.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "TGTableViewCell.h"
#import "TGModel.h"

@implementation TGTableViewCell
#define QYScreenW [UIScreen mainScreen].bounds.size.width


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(200, 40, 100, 20)];
        [self.contentView addSubview:label];
        UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(170, 10, 200, 20)];
        textLabel.adjustsFontSizeToFitWidth = YES;
       [self.contentView addSubview:textLabel];
        UILabel *detailTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(300, 80, 60, 10)];
        [self.contentView addSubview:detailTextLabel];
        
        UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(5, 0, 160, 100)];
        [self.contentView addSubview:icon];
        _qyLabel = label;
        _buycount = textLabel;
        _price = detailTextLabel;
        _iconImage = icon;
    }
    return self;
}

//布局子视图
//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    _buycount.frame = CGRectMake(121, 10, 211, 30);
//    _price.frame = CGRectMake(121,39, 211, 33);
//    _qyLabel.frame = CGRectMake(121, 70, 50, 25);
//    _icon.frame = CGRectMake(10, 10, 80, 80);
//}

//- (void)setModel:(TGModel *)model
//{
//    _model = model;
//    
//    _buycount.text = model.buycount;
//    _qyLabel.text = model.title;
//    _price.text = model.price;
//    _icon.image = [UIImage imageNamed:model.icon];
//    //self.imageView.image = [UIImage imageNamed:model.icon];
//}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
