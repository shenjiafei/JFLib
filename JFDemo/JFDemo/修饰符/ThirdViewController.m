//
//  ThirdViewController.m
//  11
//
//  Created by 刘浩浩 on 2017/3/23.
//  Copyright © 2017年 CodingFire. All rights reserved.
//

#import "ThirdViewController.h"
#import "JFDemo-Swift.h"
#import "the04ViewController.h"

//extern NSString *name;

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
//    NSLog(@"%@",name);
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    myName = @"jiafei";
    the04ViewController *forthViewVC = [[the04ViewController alloc]init];
    
    [self presentViewController:forthViewVC animated:YES completion:nil];
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
