//
//  Runtime02ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/6.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "Runtime02ViewController.h"
#import <objc/runtime.h>

@interface Runtime02ViewController ()<UITextFieldDelegate>

@end

@implementation Runtime02ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self printIvarList];
//    [self printPropertyList];
//    [self printMethodList];
    [self printProtocolList];
}

// 打印成员变量列表
- (void)printIvarList {
    unsigned int count;
    
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"ivar(%d) : %@", i, [NSString stringWithUTF8String:ivarName]);
    }
    
    free(ivarList);
}

// 打印属性列表
- (void)printPropertyList {
    unsigned int count;
    
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"propertyName(%d) : %@", i, [NSString stringWithUTF8String:propertyName]);
    }
    
    free(propertyList);
}

// 打印方法列表 把当前所有方法都打印出来
- (void)printMethodList {
    unsigned int count;
    
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"method(%d) : %@", i, NSStringFromSelector(method_getName(method)));
    }
    
    free(methodList);
}

// 打印协议列表 UITextFieldDelegate
- (void)printProtocolList {
    unsigned int count;
    
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocol(%d) : %@", i, [NSString stringWithUTF8String:protocolName]);
    }
    
    free(protocolList);
}

@end
