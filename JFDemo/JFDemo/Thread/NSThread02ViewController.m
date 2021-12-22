//
//  NSThread02ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/1.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "NSThread02ViewController.h"

//线程间通信   @interface NSObject (NSThreadPerformAdditions)
// 在主线程上执行操作
//- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait;
//- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray<NSString *> *)array;
  // equivalent to the first method with kCFRunLoopCommonModes

// 在指定线程上执行操作
//- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray *)array NS_AVAILABLE(10_5, 2_0);
//- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait NS_AVAILABLE(10_5, 2_0);

// 在当前线程上执行操作，调用 NSObject 的 performSelector:相关方法
//- (id)performSelector:(SEL)aSelector;
//- (id)performSelector:(SEL)aSelector withObject:(id)object;
//- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;

@interface NSThread02ViewController ()

@end

@implementation NSThread02ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self runOnThread];
    [self downloadImageOnSubThread];
}

- (void)run{
    NSLog(@"%@", [NSThread currentThread]);
}

-(void)runOnThread{
    //主线程
    [self performSelectorOnMainThread:@selector(run) withObject:nil waitUntilDone:nil];
    
    [self performSelectorOnMainThread:@selector(run) withObject:nil waitUntilDone:nil modes:@[NSDefaultRunLoopMode]];
    
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    
    NSThread *thread = [NSThread currentThread];
    //指定线程
    [self performSelector:@selector(run) onThread:thread withObject:nil waitUntilDone:nil];
    [self performSelector:@selector(run) onThread:thread withObject:nil waitUntilDone:nil modes:@[NSDefaultRunLoopMode]];
    
    //当前线程
    [self performSelector:@selector(run)];
    [self performSelector:@selector(run) withObject:nil];
}


/**
 * 创建一个线程下载图片
 */
- (void)downloadImageOnSubThread {
    // 在创建的子线程中调用downloadImage下载图片
    [NSThread detachNewThreadSelector:@selector(downloadImage) toTarget:self withObject:nil];
}

/**
 * 下载图片，下载完之后回到主线程进行 UI 刷新
 */
- (void)downloadImage {
    NSLog(@"current thread -- %@", [NSThread currentThread]);
    
    // 1. 获取图片 imageUrl
    NSURL *imageUrl = [NSURL URLWithString:@"https://ysc-demo-1254961422.file.myqcloud.com/YSC-phread-NSThread-demo-icon.jpg"];
    
    // 2. 从 imageUrl 中读取数据(下载图片) -- 耗时操作
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    // 通过二进制 data 创建 image
    UIImage *image = [UIImage imageWithData:imageData];
    
    // 3. 回到主线程进行图片赋值和界面刷新
    [self performSelectorOnMainThread:@selector(refreshOnMainThread:) withObject:image waitUntilDone:YES];
}

/**
 * 回到主线程进行图片赋值和界面刷新
 */
- (void)refreshOnMainThread:(UIImage *)image {
    NSLog(@"current thread -- %@", [NSThread currentThread]);
    
    // 赋值图片到imageview
//    self.imageView.image = image;
    NSLog(@"image -- %@", image);
}



@end
