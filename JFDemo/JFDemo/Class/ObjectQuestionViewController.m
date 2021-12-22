//
//  ObjectQuestionViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/21.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "ObjectQuestionViewController.h"

@interface ObjectQuestionViewController ()

@property (nonatomic, strong) NSString *string1;
@property (nonatomic, assign) NSString *string2;

@end

@implementation ObjectQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.string1 = [[NSString alloc]initWithUTF8String:"string1"];
//    self.string2 = self.string1;
//    self.string1 = nil;
//    NSLog(@"String 2 = %@",self.string2);
    
    self.string1 = [[NSString alloc]initWithUTF8String:"string1234"];
    self.string2 = self.string1;
    self.string1 = nil;
    NSLog(@"String 2 = %@",self.string2);
}

/*
Tagged Pointer做的小动作。 1.代码一不奔溃的原因是“string1”的字符数小于10，Tagged Pointer将其信息存储在指针里面（苹果的优化只考虑常见的字符，如a、b、C。只需要6bit即可保存。所以在64cpu里面，Tagged Pointer用4bit去标记类型，剩下60bit用于存储信息。结束字符占了6bit，所以最多保存9个字符）assign与weak不同，当对象释放时，它不重新设置为nil。故保留了指针内容，所以不会崩溃；对于大于9个字符的字符串，会开辟一个内存区域去存该信息，指针所存储的是内存地址。 2.assign会奔溃而其他不会的原因是，assgin不会重新置为nil。当访问了僵尸对象，就会崩。
 
 taggedpointer导致的假对象，实际储存于栈区的对象指针string1身体里，assign用以修饰简单数据类型，即栈区临时变量，与内存管理是无关的。strong修饰的对象指针会改变堆区对象引用计数，保证有强引用指针对象就不会消亡。在大于某一字符数量，taggedpointer无法优化到栈内对象指针身体内时候，会去申请堆空间储存对象。string1置nil会导致调用storeStrong()判断强引用是否指向其他堆对象，如果是，会retain新对象，然后release原对象。
 */

@end
