//
//  TGModel.h
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/31.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGModel : NSObject

@property(nonatomic,strong)NSString *buycount;
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSString *title;

- (instancetype)initWithDictonary:(NSDictionary *)dict;
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;



@end
