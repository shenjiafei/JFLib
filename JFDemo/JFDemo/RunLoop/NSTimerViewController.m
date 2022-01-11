//
//  NSTimerViewController.m
//  JFDemo
//
//  Created by shenjiafei on 2022/1/7.
//  Copyright © 2022 shenjiafei. All rights reserved.
//

#import "NSTimerViewController.h"
#import "OCViewController.h"
#import <objc/runtime.h>
#import "TCJProxy.h"

static int num = 0;

#define CJNSLog(format, ...) printf("%s\n", [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);

@interface NSTimerViewController ()

@property(nonatomic,strong)NSTimer *timer;

@property (nonatomic, strong) TCJProxy *proxy;

//@property (nonatomic, strong) id  target;

@end

@implementation NSTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.greenColor;
    [self startTimer:[NSDate date]];
}

-(void)dealloc{
    [_timer invalidate];
    _timer = nil;
}

- (void)startTimer:(NSDate *)date
{
    if (_timer == nil) {//时间间隔是100毫秒，也就是0.1秒
        
//        self.target = [[NSObject alloc]init];
//        class_addMethod([NSObject class], @selector(onTick), (IMP)fireHomeObjc, "v@:");
        self.proxy = [TCJProxy proxyWithTransformObject:self];
        _timer = [[NSTimer alloc] initWithFireDate:date interval:1.0f target:self.proxy selector:@selector(onTick) userInfo:nil repeats:YES];
    }
    
    if (_timer) {
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

//void fireHomeObjc(id obj){
//    CJNSLog(@"%s -- %@",__func__,obj);
//}


- (void)onTick
{
    num++;
    NSLog(@"onTick =  %d",num);
}

//  当一个视图控制器中添加或者移除viewController后 pop, push 是不会调用的
//-(void)didMoveToParentViewController:(UIViewController *)parent{
//    if (parent == nil) {
//        [self.timer invalidate];
//        self.timer = nil;
//    }
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    OCViewController *vc = [[OCViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
