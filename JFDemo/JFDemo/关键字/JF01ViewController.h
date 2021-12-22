//
//  JF01ViewController.h
//  Hello
//
//  Created by shenjiafei on 2021/11/29.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "JF02ViewController.h" //引用后 同样名称的修饰符就不能用了
//包括 在 11-Bridging-Header.h 文件中一起引用的，这里相当于所有的.h 相互引用


//【static 用法】 静态的，限制作用域。 但是可以重新 赋值

static  NSTimeInterval kAnimationDuration = 0.3;//修饰全局变量

static  int count = 10;

static  NSString * staticString  = @"staticString";


//【const 用法】常量 由变量转为常量, 其不可以被修改

//上面的全局变量表示的是动画执行时间, 虽然其不会受外部文件影响, 但是在内部文件是可以直接对其进行重新赋值的, 这明显不符合我们需求, 在变量前面加上关键字 const即可.

static const NSTimeInterval cAnimationDuration = 0.3;//修饰全局变量

static const NSString * constStaticString  = @"constStaticString";//内部还可以赋值

static  NSString const* constStaticString1  = @"constStaticString1";//内部还可以赋值

static  NSString * const constStaticString2  = @"constStaticString2";//内部不能赋值了


//【extern 用法】 外部的  作用是声明外部全局变量,只能申明，不能实现
//这个和上面这个写法都能实现值不被改变。
//区别是extern 可以自定义好记的名称。 不会暴露真实的值，并且可以自定义。具体参考 XLModuleLimitManager.h 的用法

//用法：使用其来声明供外部使用。

//XXXLoginNotification 修饰全局变量
//这样写的话，全局可以引用，并且不能改变其值
extern NSString *const XXXLoginNotification;

//用法：2  使用其来声明引用外部全局变量等。
//这种比较少见, 比如使用三方库时, 三方库定义了全局变量或常量, 但是并没有在 .h 用 extern 修饰其声明出来, 这时候如果我们想要去使用时, 可以直接在 .h 对其进行修饰即可直接使用

//用法：3 实际必须是一个固定的值 比如 xxxx00147445 。取一个好记的名字 ，XLUserID


//【define 用法】字符替换,没有类型 没有类型检查

#define DefineStringKey @"DefineStringKey"

#define DefineIntKey  1

#define XLSCREEN_WIDTH > 320 ? 100 : 89 //用法


//[define 与 const 选择]

//宏定义是在预编译期间处理, 在使用时系统直接进行的方法替换, 静态变量等则是在编译期间进行的。
//宏定义不会系统不会做编译检查, 所以类型错误也能通过编译, const 则会做编译检查。
//能显式的声明数据类型, 并且不会出现自己定义的宏被其他人员更换,导致出现难以排查的 Bug。
//不过宏不仅能对数据类型进行定义, 还能对函数, 结构体, 方法等进行定义相对比起常量来说作用会更多一些。
//总结
//1编译时刻：宏是预编译, const是编译阶段
//2编译检查：宏不做检查, 有错误不会提示, const会检查, 有错误会提示
//3宏的优点：高效,灵活,可用于替换各种 函数,方法,结构体,数据等;
//4宏的缺点：由于在预编译期间完成, 大量使用宏, 容易造成编译时间久
//5const优点：编译器通常不为普通 const 常量分配存储空间, 而是将它们保存在符号表中, 这使得它成为一个编译期间的常量, 没有了存储与读内存的操作, 使得它的效率也很高, 相当于宏更加高效, 并且容错率很低。
//6const缺点：const 能定义的内容非常有限, 只能用于定义常量
//7宏定义所定义的生命周期与所在的载体的生命周期有关
//8const修饰具有就近性, 即 const 后面的参数是不可变的, const修饰的参数具有只读性, 如果试图修改, 编译器就会报错
//9苹果官方不推荐我们使用宏, 推荐使用const常量
//
//建议:
//在实际开发中, 对于能使用常量定义完成的, 尽量使用常量能实现, 而不要考虑使用 宏


@interface JF01ViewController : UIViewController

@end

