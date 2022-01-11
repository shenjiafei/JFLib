//
//  LuojiViewController.m
//  JFDemo
//
//  Created by shenjiafei on 2021/12/29.
//  Copyright © 2021 shenjiafei. All rights reserved.
//

#import "LuojiViewController.h"

@interface LuojiViewController ()

@end

@implementation LuojiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

/*
init 方法是提供入口的，构造方法，工厂设计

new = alloc  init   ps:不建议直接 new，因为直接new。 init重写发方法是没有的

内存对齐，一个对象16字节，加2个属性 8+8+8 内存对齐 = 32 字节

x objec1  内存地址  == memory read objec1（小端模式）
x/4gx objec1 内存编排 以16进制 打印四排
po 0x000121211 打印出 name

x/4gxw  只打印8个

p  打印类型和地址
po 打印地址

double类型特殊处理
p/x （double）180.0


2021年12月29日 星期三

alloc方法 先调用 objc_alloc 再调用 sendmsd  alloc
内存对齐：内存优化

结构体指针大小 就是 8
结构体大小，根据属性来开辟
struct LGPerson{
  double a //8   （0-7）
  char b // 1 （8 1）8
  int c //4 （9 4
  short d //2
}
//最大属性：8
//结构体嵌套结构体：
//15 ->16
 */
@end
