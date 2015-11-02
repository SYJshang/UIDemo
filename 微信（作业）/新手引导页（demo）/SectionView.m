//
//  SectionView.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/31.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "SectionView.h"
#import "FriendGroup.h"

@interface SectionView ()

@property (nonatomic,strong)UIButton *btn;
@property (nonatomic,strong)UILabel *label;

@end

@implementation SectionView

+ (instancetype)headerViewWthTableView:(UITableView *)tableView
{
    static NSString *identifier = @"qingyun";
    SectionView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (headerView == nil) {
        headerView = [[SectionView alloc] initWithReuseIdentifier:identifier];
        
    }
    return headerView;
}


-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:btn];
        
        UIImage *image = [[UIImage imageNamed:@"buddy_header_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        
        UIImage *hightImage = [[UIImage imageNamed:@"buddy_header_bg_highlighted"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        
        [btn setBackgroundImage:image forState:UIControlStateNormal];
        [btn setBackgroundImage:hightImage forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置内容的显示
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //设置内容的偏移量
        
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //设置标题的偏移量
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //设置btn中图片视图的内容模式
        btn.imageView.contentMode = UIViewContentModeCenter;
        
        btn.imageView.clipsToBounds = NO;
        
        [btn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UILabel *label = [[UILabel alloc]init];
        [self.contentView addSubview:label];
        
        label.textAlignment = NSTextAlignmentRight;
        
        _btn = btn;
        _label = label;
        
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置bgBtn的frame
    _btn.frame = self.bounds;
    
    //设置label的frame
    CGFloat labelW = 100;
    CGFloat labelH = self.bounds.size.height;
    CGFloat labelX = self.bounds.size.width - labelW - 10;
    CGFloat labelY = 0;
    
    _label.frame = CGRectMake(labelX, labelY, labelW, labelH);
    
}


- (void)btnClick:(UIButton *)btn
{
    //1、更改当前section的打开状态
    if (_friendGroup.isOpen) {
        _friendGroup.isOpen = NO;
        
    }else{
        _friendGroup.isOpen = YES;
    }
    
    //2、刷新表视图
    if (_headerViewClick) {
        _headerViewClick();
    }
    
}


- (void)setFriendGroup:(FriendGroup *)friendGroup
{
    _friendGroup = friendGroup;
    
    [_btn setTitle:friendGroup.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%ld/%lu",(long)friendGroup.online,(unsigned long)friendGroup.friends.count];
    
    if (_friendGroup.isOpen) {
        _btn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        _btn.imageView.transform = CGAffineTransformIdentity;
    }
    
}


@end
