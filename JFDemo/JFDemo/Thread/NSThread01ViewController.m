//
//  NSThread01ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/1.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "NSThread01ViewController.h"

@interface NSThread01ViewController ()

@end

@implementation NSThread01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self create];
//    [self createAndRun];
    [self hideCreateAndRun];
}

-(void)create{
    // 1. 创建线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    // 2. 启动线程
    [thread start];    // 线程一启动，就会在线程thread中执行self的run方法
    
//    NSThread sleepUntilDate:<#(nonnull NSDate *)#>
//    [NSThread sleepForTimeInterval:1.0];
    
//    [NSThread exit];//死亡
}

-(void)createAndRun{
    // 1. 创建线程后自动启动线程
    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
}

-(void)hideCreateAndRun{
    // 1. 隐式创建并启动线程 NSThread 里面方法
    [self performSelectorInBackground:@selector(run) withObject:nil];
    [self performSelector:@selector(run) onThread:[NSThread mainThread] withObject:nil waitUntilDone:true];
    
    [self performSelector:@selector(run) withObject:nil afterDelay:0.1];
//    注意 performSelector afeter 这个是 runLoop 里面的方法[最常用]
}

// 新线程调用方法，里边为需要执行的任务
- (void)run {
    NSLog(@"%@", [NSThread currentThread]);
    
    NSLog(@"%@", [NSThread mainThread]);
    
    BOOL isMain = [[NSThread currentThread] isMainThread];//对象方法)
    
    NSLog(@"current NSThread isMain = %d", isMain);
    
    [NSThread isMainThread];//类方法)
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    
    thread.name = @"yes, this my name";
    
    NSLog(@"NSThread name = %@", thread.name);
    
}


@end
