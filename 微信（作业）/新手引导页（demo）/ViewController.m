//
//  ViewController.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/23.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "ViewController.h"
#import "QYSCrolView.h"
#import "QYViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIPageControl *pageControl;
@end

@implementation ViewController
#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.backgroundColor = [UIColor blackColor];
//    btn.frame = CGRectMake((QYScreenW + 25) * 3 - QYScreenW/2, 500, 100, 100);
//    
//    [self.scrollView addSubview:btn];
    
    //创建一个大的scrollView
    [self scrolView];
    //添加小的放大缩小视图
    [self addSmallScorllView];
    
    [self pageControlView];
}



- (void)pageControlView
{
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(120, 500, 150, 40)];
    [self.view addSubview:pageControl];
   // pageControl.backgroundColor = [UIColor redColor];
    pageControl.numberOfPages = 3;
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    _pageControl = pageControl;
    [pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventTouchUpInside];
}


-(void)pageControlClick:(UIPageControl *)pageControl
{
    //根据当前的pageControl的currentPage更改scrollView的偏移量
    _scrollView.contentOffset = CGPointMake((QYScreenW + 25) * pageControl.currentPage, 0);

}

- (void)scrolView
{
    UIScrollView *scrol = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,QYScreenW + 25 ,QYScreenH)];
    [self.view addSubview:scrol];
    
    scrol.contentSize = CGSizeMake((QYScreenW + 25) * 3, QYScreenH);
    scrol.pagingEnabled = YES;
    scrol.showsHorizontalScrollIndicator = NO;
    scrol.showsVerticalScrollIndicator = NO;
    
    scrol.delegate = self;
    _scrollView = scrol;
    _scrollView.backgroundColor = [UIColor blackColor];
}


- (void)addSmallScorllView
{
    for (int i = 0; i < 3; i++) {
        QYSCrolView *qySCrolView = [[QYSCrolView alloc]initWithFrame:CGRectMake(400 * i, 0, QYScreenW, QYScreenH)];
        [_scrollView addSubview:qySCrolView];
        
        NSString *imageNmae = [NSString stringWithFormat:@"new_feature_%d",i + 1];
//        qySCrolView.imageVIew.image = [UIImage imageNamed:imageNmae];
        [qySCrolView setValue:[UIImage imageNamed:imageNmae] forKeyPath:@"imageVIew.image"];
        if (i == 2) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
           // btn.backgroundColor = [UIColor blackColor];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitle:@"点击进入下一页" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
            btn.frame = CGRectMake(100, 550, 200, 40);
            [qySCrolView addSubview:btn];
            [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
            //[qySCrolView bringSubviewToFront:btn];
        }
    }
}

- (void)btnClick
{
    
    QYViewController *vc = [[QYViewController alloc]init];
//    UIViewController *vc1 = [[UIViewController alloc] init];
//    vc1.view.backgroundColor = [UIColor yellowColor];
    [self presentViewController:vc animated:YES completion:^{
      
    }];
    
//    [self.navigationController pushViewController:vc animated:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    for (id scroll in scrollView.subviews) {
        //判断scroll对象是否是QYScrollView类型的
        if ([scroll isKindOfClass:[QYSCrolView class]]) {
            QYSCrolView *qyScrollView = (QYSCrolView *)scroll;
            //设置缩放比例
            qyScrollView.zoomScale = 1.0;
        }
    }
    
    _pageControl.currentPage = scrollView.contentOffset.x/(QYScreenW + 25);
    
}




//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
//{
//    if (_scrollView.contentSize.width > (QYScreenW + 25) * 3) {
//        QYViewController *vc = [[QYViewController alloc]init];
//        [self presentViewController:vc animated:YES completion:^{
//            
//        }];
//    }
//
//}


@end
