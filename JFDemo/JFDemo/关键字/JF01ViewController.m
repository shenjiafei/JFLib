//
//  JF01ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/11/29.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "JF01ViewController.h"
#import "JF02ViewController.h"

@interface JF01ViewController ()

@end

//需要在.m 中实现、 不然报错
NSString *const XXXLoginNotification = @"XXXLoginNotification SSSSSSSS";//值可以是任意值


@implementation JF01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.orangeColor;
    
//    修饰局部变量
    for (NSInteger i = 0; i < 100; i++) {
        static int count = 10;
        count++;
        NSLog(@"count = %d",count);
    };
    
//    修改值只在当前有效
    kAnimationDuration  = 0.4;
    count = 11;
    staticString = @"001";
    
    
    
    NSLog(@"%f",kAnimationDuration);
    NSLog(@"%@",staticString);
    
//    这里虽然改变了值，但是 JF02ViewController引用过去 没变
    //说明，只能内部改变值 被外部引用的话，值还是原来的那个值

    
//    加上 const 关键字后，不能赋值，编译器报错
//    cAnimationDuration = 0.4;
    
    // 但是 string 类型还可以赋值
    constStaticString = @"constStaticNew";
    NSLog(@"constStaticNew = %@",constStaticString);
    
    //一样可以赋值
    constStaticString1 = @"constStaticNew1";
    NSLog(@"constStaticString1 = %@",constStaticString1);
    
    //不能赋值了
//    constStaticString2 = @"constStaticNew2";
//    NSLog(@"constStaticString2 = %@",constStaticString2);
    
    
//    【修饰局部变量】总结: const 修饰其后面内容

    const NSString * constName = @"constName";
    //使 *name 指针地址不可变, 实际指向内容不受影响, 修改指针地址编译器报错。
    NSString const * name1 = @"name1";
    ////同上面写法一致, 修饰了 name 指针地址使其不可变
    NSString * const name2 = @"name2";
    //使 *name 指针指向内容不可变, 指针地址不受影响, 修改内容则编译报错。

    //总结: const 修饰其后面内容
    

    constName = @"constName00";
    name1 = @"name11";
    //name2 = @"name22"; //const 直接修饰name2 内容不可变
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    JF02ViewController *vc = [[JF02ViewController alloc]init];
////    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc animated:true completion:nil];
}

@end
