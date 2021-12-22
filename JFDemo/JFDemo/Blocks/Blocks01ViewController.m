//
//  Blocks01ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/6.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "Blocks01ViewController.h"

typedef void(^myBlock)(void);

@interface Person : NSObject
@property (nonatomic, copy) myBlock blk;
@end


/* —————— Person.m —————— */

@implementation Person

@end


@interface Blocks01ViewController ()

@end

@implementation Blocks01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self useBlockQualifierChangeLocalVariables];
}

- (void)useBlockInterceptLocalVariables {
    int a = 10, b = 20;
    
    //在此刻已经截获 两个值a = 10, b = 20;
    void (^myLocalBlock)(void) = ^{
        printf("a = %d, b = %d\n",a, b);//这里只是打印，不改变
    };
    
    myLocalBlock();// 打印结果：a = 10, b = 20
    
    a = 20;
    b = 30;
    
    myLocalBlock();// 打印结果：a = 10, b = 20
}

// 使用 __block 说明符修饰，更改局部变量值
- (void)useBlockQualifierChangeLocalVariables {
    __block int a = 10, b = 20;
    void (^myLocalBlock)(void) = ^{
        
        printf("BBB a = %d, b = %d\n",a, b);  // 打印结果：根据调用时候
        
        a = 20;
        b = 30;//改变的话，需要__block 修饰
        
        printf("AAA a = %d, b = %d\n",a, b);  // 打印结果：a = 20, b = 30
    };
    
    myLocalBlock();
    
    a = 200;
    b = 300;
    
    myLocalBlock();// 打印结果：a = 200, b = 300
}

//如果 Blocks 截获的是 Objective-C 对象，例如 NSMutablearray 类对象，对该对象调用变更的方法是不会编译报错的（例如调用 addObject: 方法）。但是如果对其调用赋值的方法，则会编译报错，就必须要加上 __block 说明符进行修饰了。
//循环引用
-(void)retainCycleBlcokTest{
    
    //会引起循环引用
//    Person *person = [[Person alloc] init];
//    person.blk = ^{
//        NSLog(@"%@",person);
//    };

//    [MRC] 下，通过 __block 修饰符来消除循环引用
//    Person *person = [[Person alloc] init];
//    __block typeof(person) blockPerson = person;
//
//    person.blk = ^{
//        NSLog(@"%@", blockPerson);
//    };

    
//    __weak 方式消除循环引用 [ARC 下]
    Person *person = [[Person alloc] init];
    __weak typeof(person) weakPerson = person;

    person.blk = ^{
     NSLog(@"%@",weakPerson);
    };
}

@end
