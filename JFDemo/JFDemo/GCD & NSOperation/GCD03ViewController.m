//
//  GCD03ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/11/30.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "GCD03ViewController.h"

@interface GCD03ViewController ()

@end

@implementation GCD03ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self communication];
}

/**
 * 线程间通信
 */
- (void)communication {
    // 获取全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 获取主队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        // 异步追加任务 1 比如网络图片加载 下载等耗时操作
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        
        // 回到主线程
        dispatch_async(mainQueue, ^{
            // 追加在主线程中执行的任务
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        });
        
    });
//    在其他线程中先执行任务，执行完了之后回到主线程执行主线程的相应操作。
}


@end
