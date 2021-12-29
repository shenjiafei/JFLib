//
//  JFGCDTestViewController.m
//  XueLeTS
//
//  Created by shenjiafei on 2021/1/9.
//  Copyright © 2021 net.xuele. All rights reserved.
//

#import "JFGCDTestViewController.h"

@interface JFGCDTestViewController ()

@end

@implementation JFGCDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //  创建 dispatch block  第一种
        dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block);
        
    
    //   例子1
        WS(weakSelf, self);
        __block dispatch_block_t methodBlock = dispatch_block_create(0, ^{
        //        XLVCShowHTTPMsg;
            [MBProgressHUD showMessage:@"批改中..." toView:weakSelf.view];
        });
        //例子2
        dispatch_queue_t concurrentQuene = dispatch_queue_create("concurrentQuene", DISPATCH_QUEUE_CONCURRENT);
        
    //    第二种
        dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags,
        dispatch_qos_class_t qos_class, int relative_priority,
        dispatch_block_t block);
        
        __block dispatch_block_t methodBlock2 = dispatch_block_create_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0, ^{
            NSLog(@"qos do some thing...");
        });
        
   
}

/*演示 dispatch_block_wait 监听 block 执行结束
 long dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout);
 */
-(void)controlTest{
    dispatch_queue_t concurrentQuene = dispatch_queue_create("concurrentQuene", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(concurrentQuene, ^{
        dispatch_queue_t allTasksQueue = dispatch_queue_create("allTasksQueue", DISPATCH_QUEUE_CONCURRENT);

        dispatch_block_t block = dispatch_block_create(0, ^{
            NSLog(@"开始执行");
            [NSThread sleepForTimeInterval:3];
            NSLog(@"结束执行");
        });

        dispatch_async(allTasksQueue, block);
        // 等待时长，10s 之后超时
        dispatch_time_t timeout = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC));
        long resutl = dispatch_block_wait(block, timeout);
        if (resutl == 0) {
            NSLog(@"执行成功");
        } else {
            NSLog(@"执行超时");
        }
    });
}


/*演示 方法二 dispatch_block_notify  监听 block 执行结束 (不会阻塞当前线程)
 void dispatch_block_notify(dispatch_block_t block,
 dispatch_queue_t queue,
 dispatch_block_t notification_block);
 */
-(void)controlTest2{
    NSLog(@"---- 开始设置任务 ----");
    dispatch_queue_t serialQueue =   dispatch_queue_create("com.fyf.serialqueue",   DISPATCH_QUEUE_SERIAL);

    // 耗时任务
    dispatch_block_t taskBlock = dispatch_block_create(0, ^{
        NSLog(@"开始耗时任务");
        [NSThread sleepForTimeInterval:2.f];
        NSLog(@"完成耗时任务");
    });

    dispatch_async(serialQueue, taskBlock);

    // 更新 UI
    dispatch_block_t refreshUI = dispatch_block_create(0, ^{
        NSLog(@"更新 UI");
    });

    // 设置监听
    dispatch_block_notify(taskBlock, dispatch_get_main_queue(), refreshUI);
    NSLog(@"---- 完成设置任务 ----");
    
//    ---- 开始设置任务 ----
//    ---- 完成设置任务 ----
//    开始耗时任务
//    完成耗时任务
//    更新 UI
}

/*演示 dispatch_block_cancel 取消线程
void dispatch_block_cancel(dispatch_block_t block);
 */
-(void)cancelTest{
    dispatch_queue_t serialQueue = dispatch_queue_create("com.fyf.serialqueue", DISPATCH_QUEUE_SERIAL);

    // 耗时任务
    dispatch_block_t firstTaskBlock = dispatch_block_create(0, ^{
        NSLog(@"开始第一个任务");
        [NSThread sleepForTimeInterval:1.5f];
        NSLog(@"结束第一个任务");
    });

    // 耗时任务
    dispatch_block_t secTaskBlock = dispatch_block_create(0, ^{
        NSLog(@"开始第二个任务");
        [NSThread sleepForTimeInterval:2.f];
        NSLog(@"结束第二个任务");
    });

    dispatch_async(serialQueue, firstTaskBlock);
    dispatch_async(serialQueue, secTaskBlock);

    // 等待 1s，让第一个任务开始运行
    [NSThread sleepForTimeInterval:1];

    dispatch_block_cancel(firstTaskBlock);
    NSLog(@"尝试过取消第一个任务");

    dispatch_block_cancel(secTaskBlock);
    NSLog(@"尝试过取消第二个任务");
    
//    开始第一个任务
//    尝试过取消第一个任务
//    尝试过取消第二个任务
//    结束第一个任务
//    可见 dispatch_block_cancel 对已经在执行的任务不起作用，只能取消尚未执行的任务。
}

/*dispath 通常用法
dispatch_get_main_queue 代表应用主线程执行，可以在内部更新UI（并不会阻塞主线程）

dispatch_get_global_queue 代表在系统后台运行，不一定和UI在同一线程，不能更新UI,适用于网络处理与Core Data等的处理。
*/


-(void)customUse{
    //异步执行
    dispatch_async(dispatch_get_main_queue, ^{
        
    })
    // 延迟异步执行 延迟1s 后执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    
//   先后台运行，再更新UI
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    })
    
}

//修改block之外的变量
-(void)blockDemo{
    __block int a = 0;
    void  (^foo)(void) = ^{
        a = 1;
    }
    foo();
    // 这里，a的值被修改为1
}

//高级用法，例如让后台2个线程并行执行，然后等2个线程都结束后，再汇总执行结果。这个可以用dispatch_group, dispatch_group_async 和 dispatch_group_notify来实现，示例如下：
-(void)heightUse{
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
        // 并行执行的线程一
        });
    dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
        // 并行执行的线程二
        });
    dispatch_group_notify(group, dispatch_get_global_queue(0,0), ^{
        // 汇总结果
        });
}


@end
