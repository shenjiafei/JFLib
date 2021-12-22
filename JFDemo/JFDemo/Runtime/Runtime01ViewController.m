//
//  Runtime01ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/6.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "Runtime01ViewController.h"
#include "objc/runtime.h"//需要加

@interface Runtime01ViewController ()

@end

@implementation Runtime01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//上边的示例中，stringWithFormat: 被发送给了 NSString 类，NSString 类 通过 isa 指针 找到 NSString 元类，然后在该元类的方法列表中找到对应的 stringWithFormat: 方法，然后执行该方法。
    NSString *testString = [NSString stringWithFormat:@"%d,%s",3, "test"];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 执行 fun 函数
     [self performSelector:@selector(fun)];
}

// 重写 resolveInstanceMethod: 添加对象方法实现
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(fun)) { // 如果是执行 fun 函数，就动态解析，指定新的 IMP
        class_addMethod([self class], sel, (IMP)funMethod, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void funMethod(id obj, SEL _cmd) {
    NSLog(@"funMethod"); //新的 fun 函数
}


// 消息接受者重定向
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(fun)) {
//        return [[Person alloc] init];
//        // 返回 Person 对象，让 Person 对象接收这个消息
//    }
//    
//    return [super forwardingTargetForSelector:aSelector];
//}


@end
