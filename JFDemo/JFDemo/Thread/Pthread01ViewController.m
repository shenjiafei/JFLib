//
//  Pthread01ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/1.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "Pthread01ViewController.h"
#import <pthread.h>

@interface Pthread01ViewController ()

@end

@implementation Pthread01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self create];
}

-(void)create{
    // 1. 创建线程: 定义一个pthread_t类型变量
    pthread_t thread;
    // 2. 开启线程: 执行任务
    pthread_create(&thread, NULL, run, NULL);
    // 3. 设置子线程的状态设置为 detached，该线程运行结束后会自动释放所有资源
    pthread_detach(thread);

}

//指针函数写法
void * run(void *param)    // 新线程调用方法，里边为需要执行的任务
{
    NSLog(@"%@", [NSThread currentThread]);

    return NULL;
}

//-(void)run{
//    NSLog(@"%@", [NSThread currentThread]);
//}


//pthread_create() 创建一个线程
//pthread_exit() 终止当前线程
//pthread_cancel() 中断另外一个线程的运行
//pthread_join() 阻塞当前的线程，直到另外一个线程运行结束
//pthread_attr_init() 初始化线程的属性
//pthread_attr_setdetachstate() 设置脱离状态的属性（决定这个线程在终止时是否可以被结合）
//pthread_attr_getdetachstate() 获取脱离状态的属性
//pthread_attr_destroy() 删除线程的属性
//pthread_kill() 向线程发送一个信号


@end
