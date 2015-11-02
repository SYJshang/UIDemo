//
//  QYViewController.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/23.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "QYViewController.h"
//#import "NavitionViewController.h"
#import "TabBarController.h"

@interface QYViewController ()
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic ,strong)UITextField *userName;
@property (nonatomic ,strong)UITextField *passWord;
@end

@implementation QYViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:imageView];
    UIImage *image = [UIImage imageNamed:@"table1.jpg"];
    [imageView setImage:image];
    _imageView = imageView;
    imageView.userInteractionEnabled = YES;
    [self setUplabelAndtextFiled];
    [self setUpBtn];
    
}


//创建btn
- (void)setUpBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(110, 400, 150, 40);
    [self.view addSubview:btn];
    [btn setBackgroundImage:[UIImage imageNamed:@"buttonred"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"buttonred_highlighted"] forState:UIControlStateHighlighted];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor greenColor]];
    [btn addTarget:self action:@selector(btnCilck) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnCilck
{
    
    if ([_userName.text isEqualToString:@""] || [_passWord.text isEqualToString:@""]) {
        [self showAlertView:@"用户名和密码不能为空"];
        return;
    }
    //判断用户名和密码是否正确
    
    if (![_userName.text isEqualToString:@"1"] || ![_passWord.text isEqualToString:@"q"]) {
        [self showAlertView:@"用户名或密码错误"];
        return;
    }
//    UITabBarController *tabVC = [self.storyboard instantiateViewControllerWithIdentifier:@"tab"];
    
    TabBarController *nation = [[TabBarController alloc]init];

    [self presentViewController:nation animated:YES completion:nil];
}

-(void)showAlertView:(NSString *)msg
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
}

//创建label以及textfiled
- (void)setUplabelAndtextFiled
{
    //创建label
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(60, 100, 70, 40)];
    [_imageView addSubview:label];
    //label.backgroundColor = [UIColor greenColor];
    label.text = @"登录名:";
    [label setTextColor:[UIColor greenColor]];
    UILabel *passLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 200, 70, 40)];
    [_imageView addSubview:passLabel];
    [passLabel setTextColor:[UIColor greenColor]];
    //label.backgroundColor = [UIColor greenColor];
    passLabel.text = @"密  码:";
    
    //创建textfiled
    UITextField *textFiled = [[UITextField alloc]initWithFrame:CGRectMake(140,100 , 150, 40)];
    [_imageView addSubview:textFiled];
    textFiled.keyboardType =UIKeyboardTypeNumberPad;
    textFiled.placeholder = @"请输入登录名";
    _userName = textFiled;
    
    
    UITextField *textFiled1 = [[UITextField alloc]initWithFrame:CGRectMake(140,200 , 150, 40)];
    [_imageView addSubview:textFiled1];
    textFiled1.placeholder = @"请输入密码";
    textFiled1.secureTextEntry = YES;
    _passWord = textFiled1;

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //取消所有的UITextField的第一响应
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
