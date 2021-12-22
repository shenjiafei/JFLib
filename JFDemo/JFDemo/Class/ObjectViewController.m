//
//  ObjectViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/7.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "ObjectViewController.h"

// 其中_cpu、_size、_color 就是 Iphone  类的成员变量
//成员变量存储在当前对象对应的堆的存储空间中，不会被自动释放，只能手动释放
//成员变量前加下划线"_"是苹果的编程规范，或者说是程序员的习惯。
@interface Iphone : NSObject
{
    // 成员变量声明
   @public
   int _cpu;
   
   @private //只能在当前类的对象方法中才能直接访问
   int _size;
   
   @protected//只能在当前类和子类的对象方法中访问
   int _color;
   
   @package//只要处于同一个框架中相当于public，在框架外部相当于private
   double _weight;
}

@end


@implementation Iphone


@end


@interface ObjectViewController ()

@property (nonatomic, assign,readonly) int num;

//readonly 只生成getter方法，不生成setter方法

@property (nonatomic, assign,getter = isOpen) BOOL open;

//isOpen 可以代替 open


//assign 仅仅只会生成普通的getter/setter方法，用于直接赋值，不做任何内存管理

@property (nonatomic, retain) NSNumber *count;
//retain：会自动帮我们生成getter/setter方法内存管理的代码，在setter方法中，对传入的对象进行引用计数加1的操作。retain一般用于NSObjct类以及其子类

//copy：对原有对象进行拷贝。常用于NSString类
@property (nonatomic, copy) NSString *string;

//strong：开启ARC时才使用。强引用指针，相当于retain。默认情况下为strong
@property (nonatomic, strong) UIButton *btn;

//weak：开启ARC时才使用。弱引用指针，相当于assign
@property (nonatomic, weak) UIButton *btn2;


@end

@implementation ObjectViewController

@synthesize demoInt = _demoInt; //如果只写 demoInt 就用 demoInt 不用_demoInt

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//-(NSNumber *)count {    // getter方法
//    return _count;
//}

-(void)setCount:(NSNumber *)count {    // setter
   // 1.判断传入的对象和当前对象是否一样
    if (_count != count) {
        // 2.release以前的对象
//        [_count release];
        // 3.retain传入的对象
//        _count = [count retain];
        _count = count;
    }
}

@end
