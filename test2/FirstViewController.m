//
//  FirstViewController.m
//  test2
//
//  Created by baidu on 16/7/18.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    UIWindow *tt=((AppDelegate *)[UIApplication sharedApplication].delegate).window2;
    ViewController *vc=[[ViewController alloc]init];
    tt.rootViewController=vc;
    tt.hidden=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
