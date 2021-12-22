//
//  JF02ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/11/29.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "JF02ViewController.h"
#import "JF01ViewController.h" //写在.m 中，自己的.h 上面的也不能重名

//static  NSTimeInterval kAnimationDuration = 0.6;//修饰全局变量

@interface JF02ViewController ()

@end

@implementation JF02ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.grayColor;
    
    kAnimationDuration = 0.7;//可以改值
    
//    cAnimationDuration = 0.7;//改不了
    
//    constStaticString2 = @"xxxx";//改不了
    
    NSLog(@"%f",kAnimationDuration);
    NSLog(@"%@",staticString);
    NSLog(@"%@",constStaticString); //还是原来的值
    
    NSLog(@"%@",constStaticString2);
    
    
//    XXXLoginNotification = @"xxxx"; 可以引用，但不能改值，
                                               
    NSLog(@"%@",XXXLoginNotification);
    
}


@end
