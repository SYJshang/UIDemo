//
//  TGScrollerView.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/31.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "TGScrollerView.h"

@implementation TGScrollerView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imageView];
        _imageView = imageView;
        
        self.maximumZoomScale = 2.0;
        self.minimumZoomScale = 0.2;
        self.delegate = self;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
        tap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

-(void)doubleClick:(UITapGestureRecognizer *)tap{
    if (self.zoomScale != 1.0) {
        self.zoomScale = 1.0;
        return;
    }
    //设置双击缩放
    CGPoint location = [tap locationInView:self];
    
    [self zoomToRect:CGRectMake(location.x - 10, location.y - 10, 20, 20) animated:YES];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imageView;
}


@end
