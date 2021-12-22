//
//  RunLoop01ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/2.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "RunLoop01ViewController.h"

@interface RunLoop01ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) NSThread *thread;

@end

@implementation RunLoop01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self createDemo];
//    [self CFRunLoopObserverRefTest];
    
//    [self showDemo1]; // 用来展示CFRunLoopModeRef和CFRunLoopTimerRef的结合使用
    
    [self showDemo2]; // 用来展示CFRunLoopObserverRef使用

//    [self showDemo4]; // 用来展示常驻内存的方式
    
}

- (void)run
{
    NSLog(@"---run");
}

-(void)createDemo{
    // 定义一个定时器，约定两秒之后调用self的run方法
       NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];

       // 将定时器添加到当前RunLoop的NSDefaultRunLoopMode下
       [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];//拖动Text View滚动时，我们发现：run方法不打印了，也就是说NSTimer不工作了。而当我们松开鼠标的时候，NSTimer就又开始正常工作了。
    
    
//    NSDefaultRunLoopMode 改为 forMode:UITrackingRunLoopMode
//    定时器只会在拖动Text View的模式下工作，而不做操作的时候定时器就不工作。
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//    改成 NSRunLoopCommonModes 即可两种模式下都工作
    
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
//    默认就是NSDefaultRunLoopMode

//    相当于
    NSTimer *timer2 = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer2 forMode:NSDefaultRunLoopMode];

}

-(void)create{
//    Foundation
    [NSRunLoop currentRunLoop];
    [NSRunLoop mainRunLoop];
    
//    CFRunLoopModeRef
/*
    1.[kCFRunLoopDefaultMode]：App的默认运行模式，通常主线程是在这个运行模式下运行
    2.[UITrackingRunLoopMode]：跟踪用户交互事件（用于 ScrollView 追踪触摸滑动，保证界面滑动时不受其他Mode影响）
    3.UIInitializationRunLoopMode：在刚启动App时第进入的第一个 Mode，启动完成后就不再使用
    4.GSEventReceiveRunLoopMode：接受系统内部事件，通常用不到
    5.[kCFRunLoopCommonModes]：伪模式，不是一种真正的运行模式（后边会用到）
 [比较常用]
 
 CFRunLoopTimerRef 基于时间的触发器，基本上就是NSTimer
*/
}

//CFRunLoopObserverRef观察者，用来监听RunLoop的状态改变
//typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
//    kCFRunLoopEntry = (1UL << 0),               // 即将进入Loop：1
//    kCFRunLoopBeforeTimers = (1UL << 1),        // 即将处理Timer：2
//    kCFRunLoopBeforeSources = (1UL << 2),       // 即将处理Source：4
//    kCFRunLoopBeforeWaiting = (1UL << 5),       // 即将进入休眠：32
//    kCFRunLoopAfterWaiting = (1UL << 6),        // 即将从休眠中唤醒：64
//    kCFRunLoopExit = (1UL << 7),                // 即将从Loop中退出：128
//    kCFRunLoopAllActivities = 0x0FFFFFFFU       // 监听全部状态改变
//};

-(void)CFRunLoopObserverRefTest{
    // 创建观察者
        CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
            NSLog(@"监听到RunLoop发生改变---%zd",activity);
        });

        // 添加观察者到当前RunLoop中
        CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);

        // 释放observer，最后添加完需要释放掉
        CFRelease(observer);

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self showDemo3]; // 用来展示UIImageView的延迟显示
    
    // 利用performSelector调用常驻线程self.thread的run2方法
//    [self performSelector:@selector(run2) onThread:self.thread withObject:nil waitUntilDone:NO]; // 用来展示常驻内存的方式
}



/**
 * 第一个例子：用来展示CFRunLoopModeRef和CFRunLoopTimerRef的结合使用
 */
- (void)showDemo1
{
    // 定义一个定时器，约定两秒之后调用self的run方法
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    // 将定时器添加到当前RunLoop的NSDefaultRunLoopMode下,一旦RunLoop进入其他模式，定时器timer就不工作了
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
//    // 将定时器添加到当前RunLoop的UITrackingRunLoopMode下，只在拖动情况下工作
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
//
//    // 将定时器添加到当前RunLoop的NSRunLoopCommonModes下，定时器就会跑在被标记为Common Modes的模式下
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    // 调用了scheduledTimer返回的定时器，已经自动被加入到了RunLoop的NSDefaultRunLoopMode模式下。
//    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
}

/**
 * 第二个例子：用来展示CFRunLoopObserverRef使用
 */
- (void)showDemo2
{
    // 创建观察者
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        NSLog(@"监听到RunLoop发生改变---%zd",activity);
    });
    
    // 添加观察者到当前RunLoop中
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    
    // 释放observer
    CFRelease(observer);
}

/**
 * 第三个例子：用来展示UIImageView的延迟显示
 */
- (void)showDemo3
{
    [self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"tupian"] afterDelay:4.0 inModes:@[NSDefaultRunLoopMode]];
}

- (IBAction)BtnClick:(id)sender {
    NSLog(@".....");
}
@end
