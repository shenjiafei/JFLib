//
//  GCD01ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/11/30.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "GCD01ViewController.h"

@interface GCD01ViewController ()

@end

@implementation GCD01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self create];
    [self demo1];
}



-(void)create{
    
//【队列创建 与获取】
    
    dispatch_queue_t queue = dispatch_queue_create("aaaaa", DISPATCH_QUEUE_CONCURRENT);//DISPATCH_QUEUE_SERIAL
    
    // 主队列的获取方法（串行）
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    // 全局并发队列的获取方法(并发)
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

//【任务创建】
    
    // 同步执行任务创建方法
    dispatch_sync(queue, ^{
        // 这里放同步执行任务代码
    });
    // 异步执行任务创建方法
    dispatch_async(queue, ^{
        // 这里放异步执行任务代码
    });
    
}


-(void)demo1{
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{    // 异步执行 + 串行队列
        dispatch_sync(queue, ^{  // 同步执行 + 当前串行队列
            // 追加任务 1
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        });
    });

//    执行上面的代码会导致 串行队列中追加的任务 和 串行队列中原有的任务 两者之间相互等待，阻塞了『串行队列』，最终造成了串行队列所在的线程（子线程）死锁问题。

//    主队列造成死锁也是基于这个原因，所以，这也进一步说明了主队列其实并不特殊。
}

@end
