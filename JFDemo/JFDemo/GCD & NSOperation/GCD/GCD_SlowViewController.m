//
//  GCD_SlowViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/11/30.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "GCD_SlowViewController.h"

@interface GCD_SlowViewController ()

@end

@implementation GCD_SlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //死锁 Demo
    [self dispatch_sync_slow];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //创建队列 并发
    dispatch_queue_t queue = dispatch_queue_create("aaaaa", DISPATCH_QUEUE_CONCURRENT);
//    顺序执行
    NSLog(@"顺序执行1");
//    创建一个异步函数
    dispatch_async(queue, ^{
        NSLog(@"异步函数1");//不用等待
        
        dispatch_sync(queue, ^{
            NSLog(@"同步函数1");
        });
        
        NSLog(@"异步函数2");
    });
    
//    顺序执行
    NSLog(@"顺序执行2");
    
}

//死锁
-(void)dispatch_sync_slow{
    //创建队列 串行
    dispatch_queue_t queue = dispatch_queue_create("aaaaa", DISPATCH_QUEUE_SERIAL);//DISPATCH_QUEUE_CONCURRENT
//    顺序执行
    NSLog(@"1");
//    创建一个异步函数
    dispatch_async(queue, ^{
        NSLog(@"2");//不用等待
        
        dispatch_sync(queue, ^{
            NSLog(@"3");
        });
        
        NSLog(@"4");
    });
    
//    顺序执行
    NSLog(@"5");
}

//15 好解释
//2 也好解释
//串行(FIFO),先进先出  2 -> block -> 4
//block 是同步函数 ，先执行 block，block 加了 任务3 到队列后面，
// 任务2 任务block 任务4 任务3 （当前）
//因为 4在3前面，3要等4结束，4要等 block 结束，blcok 要等3结束 死锁了



//结果是 1 5 2 死锁
//先执行任务1,串行队列，再执行异步函数，异步函数不用的等待，执行5任务，再执行异步函数，因为是串行(FIFO),先进先出原则，先执行 2 任务，再执行block块任务，再执行4任务,因为block块是同步函数（必须等待当前语句执行完毕，才会执行下一条语句），所以先执行block块，block块又添加了3任务到队列后面，串行队列任务现在是 任务2，任务block,任务4，任务3 ，又因为4任务在3任务前面，所以3要等4任务结束，4要等block块结束 block 要等3任务结束 才走4，所以就出现了死锁(dispatch_sync_slow)的现象
//

@end
