//
//  TGModel.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/31.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "TGModel.h"

@implementation TGModel

- (instancetype)initWithDictonary:(NSDictionary *)dict
{
    if (self = [super init]) {
    [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


+ (instancetype)modelWithDictionary:(NSDictionary *)dict
{
    TGModel *model = [[TGModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
    
    //    return [[self alloc]initWithDictonary:dict];
}
@end
