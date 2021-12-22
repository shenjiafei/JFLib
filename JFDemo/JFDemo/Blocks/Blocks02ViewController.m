//
//  Blocks02ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/6.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "Blocks02ViewController.h"

int global_val = 10; // 全局变量
static int static_global_val = 20; // 静态全局变量

@interface Blocks02ViewController ()

@end

@implementation Blocks02ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    static int static_val = 30; // 静态局部变量

    void (^myLocalBlock)(void) = ^{
        global_val *= 1;
        static_global_val *= 2;
        static_val *= 3;

       printf("static_val = %d, static_global_val = %d, global_val = %d\n",static_val, static_global_val, global_val);
    };

    myLocalBlock();
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
