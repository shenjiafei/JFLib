//
//  SecViewController.h
//  11
//
//  Created by 刘浩浩 on 2017/3/23.
//  Copyright © 2017年 CodingFire. All rights reserved.
//

#import <UIKit/UIKit.h>


////【define 用法】字符替换,没有类型 可以应用到
//
#define DefineStringKey @"DefineStringKey"

#define DefineIntKey  1

#define XLSCREEN_WIDTH > 320 ? 100 : 89 //用法
//
//
////【static 用法】 静态的，限制作用域。 但是可以重新 赋值
//
//static  NSTimeInterval kAnimationDuration = 0.3;//修饰全局变量
//
//static  int count = 10;
//
//static  NSString * staticString  = @"staticString";
//
//
////【const 用法】常量
//
//const NSString * name = @"name";
////使 *name 指针地址不可变, 实际指向内容不受影响, 修改指针地址编译器报错。
////NSString const * name1 = @"   name1";
//////同上面写法一致, 修饰了 name 指针地址使其不可变
////NSString * const name2 = @"name2";
////使 *name 指针指向内容不可变, 指针地址不受影响, 修改内容则编译报错。
//
////总结: const 修饰其后面内容


@interface SecViewController : UIViewController

@end
