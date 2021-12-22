//
//  GCD05ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/11/30.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "GCD05ViewController.h"

@interface GCD05ViewController ()

@property (nonatomic, assign) int ticketSurplusCount;
@property (nonatomic, strong) dispatch_semaphore_t semaphoreLock;

@end

@implementation GCD05ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self semaphoreSync];
//    [self initTicketStatusNotSave];
//    [self initTicketStatusSave];
}

//AFNetworking 中 AFURLSessionManager.m 里面的 tasksForKeyPath: 方法。通过引入信号量的方式，等待异步执行任务结果，获取到 tasks，然后再返回该 tasks。
//- (NSArray *)tasksForKeyPath:(NSString *)keyPath {
//    __block NSArray *tasks = nil;
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
//    [self.session getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *uploadTasks, NSArray *downloadTasks) {
//        if ([keyPath isEqualToString:NSStringFromSelector(@selector(dataTasks))]) {
//            tasks = dataTasks;
//        } else if ([keyPath isEqualToString:NSStringFromSelector(@selector(uploadTasks))]) {
//            tasks = uploadTasks;
//        } else if ([keyPath isEqualToString:NSStringFromSelector(@selector(downloadTasks))]) {
//            tasks = downloadTasks;
//        } else if ([keyPath isEqualToString:NSStringFromSelector(@selector(tasks))]) {
//            tasks = [@[dataTasks, uploadTasks, downloadTasks] valueForKeyPath:@"@unionOfArrays.self"];
//        }
//
//        dispatch_semaphore_signal(semaphore);
//    }];
//
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//
//    return tasks;
//}

/**
 * semaphore 线程同步
 * 线程同步，将异步执行任务转换为同步执行任务。
 */
- (void)semaphoreSync {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"semaphore---begin");
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    __block int number = 0;
    dispatch_async(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        
        number = 100;
        
        dispatch_semaphore_signal(semaphore);
    });
    //虽然是异步并行，但是这里会等待信号量改变，所以阻塞了，导致semaphore---end打印，不是马上就能执行
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"semaphore---end,number = %zd",number);
    
//    semaphore---end 是在执行完 number = 100; 之后才打印的。而且输出结果 number 为 100。这是因为 异步执行 不会做任何等待，可以继续执行任务。
    
//    执行顺如下：
//    1. semaphore 初始创建时计数为 0。
//    2. 异步执行 将 任务 1 追加到队列之后，不做等待，接着执行 dispatch_semaphore_wait 方法，semaphore 减 1，此时 semaphore == -1，当前线程进入等待状态。
//    3. 然后，异步任务 1 开始执行。任务 1 执行到 dispatch_semaphore_signal 之后，总信号量加 1，此时 semaphore == 0，正在被阻塞的线程（主线程）恢复继续执行。
//    4. 最后打印 semaphore---end,number = 100。
//    这样就实现了线程同步，将异步执行任务转换为同步执行任务。
//
}

/**
 * 非线程安全：不使用 semaphore
 * 初始化火车票数量、卖票窗口（非线程安全）、并开始卖票
 */
- (void)initTicketStatusNotSave {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"semaphore---begin");
    
    self.ticketSurplusCount = 50;
    
    // queue1 代表北京火车票售卖窗口
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
    // queue2 代表上海火车票售卖窗口
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(queue1, ^{
        [weakSelf saleTicketNotSafe];
    });
    
    dispatch_async(queue2, ^{
        [weakSelf saleTicketNotSafe];
    });
}

/**
 * 售卖火车票（非线程安全）
 */
- (void)saleTicketNotSafe {
    while (1) {
        
        if (self.ticketSurplusCount > 0) {  // 如果还有票，继续售卖
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        } else { // 如果已卖完，关闭售票窗口
            NSLog(@"所有火车票均已售完");
            break;
        }
        
    }
}

/**
 * 线程安全：使用 semaphore 加锁
 * 初始化火车票数量、卖票窗口（线程安全）、并开始卖票
 */
- (void)initTicketStatusSave {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"semaphore---begin");
    
    self.semaphoreLock = dispatch_semaphore_create(1);
    
    self.ticketSurplusCount = 50;
    
    // queue1 代表北京火车票售卖窗口
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
    // queue2 代表上海火车票售卖窗口
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(queue1, ^{
        [weakSelf saleTicketSafe];
    });
    
    dispatch_async(queue2, ^{
        [weakSelf saleTicketSafe];
    });
}

/**
 * 售卖火车票（线程安全）
 * 卖票的这段代码 有可能会出现卡住 saleTicketSafe 任务所在的线程的问题。 如果你在上海窗口卖票，如果北京窗口一直处于卖票状态，不结束的话，应该是会卡住的。 所以，在这里边加入回调的话，应该会卡在semaphore_wait，回调不会执行。
 */
- (void)saleTicketSafe {
    while (1) {
        // 相当于加锁
        dispatch_semaphore_wait(self.semaphoreLock, DISPATCH_TIME_FOREVER);
        
        if (self.ticketSurplusCount > 0) {  // 如果还有票，继续售卖
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        } else { // 如果已卖完，关闭售票窗口
            NSLog(@"所有火车票均已售完");
            
            // 相当于解锁
            dispatch_semaphore_signal(self.semaphoreLock);
            break;
        }
        
        // 相当于解锁
        dispatch_semaphore_signal(self.semaphoreLock);
    }
}

//理解为DispatchQueue并不是我理解上的线程，而仅仅像是一个任务数组，由他去调度一个或多个“真正的”线程（）去执行数组任务，也就有了串行并发。
//DispatchQueue 相当于任务队列这是 GCD 语法层面的，线程是系统层面的。由 GCD 语法去调用系统的线程操作进程串行、并发。

@end
