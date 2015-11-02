//
//  FriendGroup.h
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/31.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendGroup : NSObject

@property (nonatomic,strong)NSMutableArray *friends;
@property (nonatomic,strong)NSString *name;
@property (nonatomic)NSInteger online;
@property (nonatomic) BOOL isOpen;


- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)friendGroupWithDictionary:(NSDictionary *)dict;

@end
