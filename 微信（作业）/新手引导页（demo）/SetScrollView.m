//
//  SetScrollView.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/11/1.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "SetScrollView.h"

@implementation SetScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:imageView];
        _imageView = imageView;
        
        
        self.maximumZoomScale = 2.0;
        self.minimumZoomScale = 0.5;
        self.delegate = self;
        
        UITapGestureRecognizer *tapgest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleClick:)];
        tapgest.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tapgest];
        
    }
    return self;
}

- (void)doubleClick:(UITapGestureRecognizer *)tap
{
    if (self.zoomScale != 1.0) {
        self.zoomScale = 1.0;
        return;
    }
    
    CGPoint location = [tap locationInView:self];
    CGRect  rect = CGRectMake(location.x - 100, location.y - 100, 200, 200);
    [self zoomToRect:rect animated:YES];
    
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

@end
