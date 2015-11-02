//
//  FriendGroup.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/31.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "FriendGroup.h"
#import "FriendModel.h"

@implementation FriendGroup

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *array =[NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            FriendModel *friend = [FriendModel friendWithDictionary:dict];
            [array addObject:friend];
        }
        self.friends = array;
        
    }
    return  self;
}
+ (instancetype)friendGroupWithDictionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDictionary:dict];
}


@end
