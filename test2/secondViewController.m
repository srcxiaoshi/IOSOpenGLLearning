//
//  secondViewController.m
//  test2
//
//  Created by baidu on 16/6/30.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "secondViewController.h"
#import "FirstViewController.h"
#import "AppDelegate.h"
#import "SquareViewController.h"
@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    if (!self.window) {
        self.window=[[UIWindow alloc]init];
    }
    if(!((AppDelegate *)[UIApplication sharedApplication].delegate).window2)
    {
        ((AppDelegate *)[UIApplication sharedApplication].delegate).window2=[UIWindow new];
        self.window=((AppDelegate *)[UIApplication sharedApplication].delegate).window2;
    }
    self.window.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-180-10, [UIScreen mainScreen].bounds.size.height-100-50, 180, 100);
    
    
    
    UIButton *btn=[[UIButton alloc]init];
    btn.frame=CGRectMake(100, 100, 100, 100);
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(clict) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //
    UIButton *openglbtn=[[UIButton alloc]init];
    openglbtn.frame=CGRectMake(100, 200, 100, 100);
    openglbtn.backgroundColor=[UIColor blueColor];
    [openglbtn addTarget:self action:@selector(GLclict) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openglbtn];
    
}
-(void)clict
{
    FirstViewController *tt=[[FirstViewController alloc]init];
    self.window.hidden=YES;
    [self.navigationController pushViewController:tt animated:YES];
}
-(void)GLclict
{
    SquareViewController * sq=[[SquareViewController alloc]init];
    [self.navigationController pushViewController:sq animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
