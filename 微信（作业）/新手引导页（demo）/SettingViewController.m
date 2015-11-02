//
//  SettingViewController.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/11/1.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "SettingViewController.h"
#import "SetScrollView.h"

@interface SettingViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scrollView;
@end


@implementation SettingViewController
#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
    
    self.navigationController.navigationBar.translucent = NO;
    //创建一个大的scrollView
    [self scrolView];
    //添加小的放大缩小视图
    [self addSmallScorllView];
    

    
    // Do any additional setup after loading the view.
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
        SetScrollView *qyScrolView = [[SetScrollView alloc]initWithFrame:CGRectMake(400 * i, 0, QYScreenW, QYScreenH)];
        [_scrollView addSubview:qyScrolView];
        
        NSString *imageNmae = [NSString stringWithFormat:@"girl%d.jpg",i + 1];
        //        qySCrolView.imageVIew.image = [UIImage imageNamed:imageNmae];
        [qyScrolView setValue:[UIImage imageNamed:imageNmae] forKeyPath:@"imageView.image"];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    for (id scroll in scrollView.subviews) {
        //判断scroll对象是否是QYScrollView类型的
        if ([scroll isKindOfClass:[SetScrollView class]]) {
            SetScrollView *qyScrollView = (SetScrollView *)scroll;
            //设置缩放比例
            qyScrollView.zoomScale = 1.0;
        }
    }
  
}


@end
