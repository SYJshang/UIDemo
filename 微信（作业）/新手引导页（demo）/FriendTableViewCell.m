//
//  FriendTableViewCell.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/31.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "FriendTableViewCell.h"

@implementation FriendTableViewCell

-(void)setFriend:(FriendModel *)friend
{
    _friend = friend;
    
    self.imageView.image = [UIImage imageNamed:friend.icon];
    self.textLabel.text = friend.name;
    self.detailTextLabel.text = friend.status;
    self.isVip = friend.vip;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
