//
//  FZStringOCViewController.m
//  JFDemo
//
//  Created by shenjiafei on 2022/1/13.
//  Copyright © 2022 shenjiafei. All rights reserved.
//

#import "FZStringOCViewController.h"

@interface FZStringOCViewController ()

@end

@implementation FZStringOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSArray *arr = [[NSArray alloc]initWithObjects:@"hello",@"word",@"jiafei", nil];

    //  【如果数组没有生成】
    //如果输入是 字符串 “hello word jiafei” 要求倒序输出
    
    NSString  *str = @"  hello word jiafei  ";
    
    NSLog(@"最终输出：%@",[self reverseWords04:str]);
    
    //可以直接操作字符串

    //第一步，生成数组：根据空格分割
//    NSArray *array = [str componentsSeparatedByString:@" "];
//
//    NSMutableArray *strArr = [NSMutableArray arrayWithArray:array];
    
//    NSLog(@"%@",[self reverseWords01:strArr]);
}

-(NSString *)reverseWords01:(NSMutableArray *)strArr{
  
    NSMutableString *mstring = [[NSMutableString alloc] init];
    //    ————————————————————————————
    //方法一.如果是数组已经生成  那么直接调用系统倒序方法
    //        正向 objectEnumerator
    NSEnumerator *enumer = [strArr reverseObjectEnumerator];
    NSArray * newArr = [enumer allObjects]; //产生新数组了
    for (NSString *str in newArr) {
        if (mstring.length != 0) {
            [mstring appendString:@" "];
        }
        [mstring appendString:str];
    }
    return mstring;
}

-(NSString *)reverseWords02:(NSMutableArray *)strArr{
    //方法二 只需要输入字符串，那么直接倒序遍历 enumerateObjectsWithOptions
    
    NSMutableString *mstring = [[NSMutableString alloc] init];
    
    [strArr enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx != mstring.length) {
            [mstring appendString:@" "];
        }
        [mstring appendString:obj];
    }];

    //    [strArr enumerateObjectsUsingBlock:^(NSString *   _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //        [mstring appendString:obj];
    //    }];
    return mstring;
}

//不要使用辅助空间，空间复杂度要求为O(1)。
//-(NSString *)reverseWords03:(NSMutableArray *)strArr{
//
//}



//要求就给一个字符串，不生成新的数组
-(NSString *)reverseWords04:(NSString *)str{
    
    NSMutableString *mstring = [[NSMutableString alloc] init];
    
    //去除前后空格
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    str = [str stringByTrimmingCharactersInSet:set];
    
    //整个字符串反转
    NSString *resultStr = [self fanzhuan:str];
    
    [resultStr enumerateSubstringsInRange:NSMakeRange(0, resultStr.length - 1) options:NSStringEnumerationByWords usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        NSLog(@"substring--- %@ range :%@", substring, NSStringFromRange(substringRange));
        if (mstring.length) {
            [mstring appendString:@" "];
        }
        [mstring appendString:[self fanzhuan:substring]];
    }];
    
    return mstring;
}

-(NSString *)fanzhuan:(NSString *)str{
    //整个字符串反转
    NSString *resultStr = @"";
    for (NSInteger i = str.length -1; i >= 0; i--) {
      NSString *indexStr = [str substringWithRange:NSMakeRange(i, 1)];
      resultStr = [resultStr stringByAppendingString:indexStr];
    }
    return resultStr;
}

//-(NSString *)fanzhuan2:(NSString *)str{
//    NSMutableString *resultStr = [[NSMutableString alloc]initWithString:str];
//
//    NSInteger start = 0;
//    NSInteger end = resultStr.length - 1;
//
//    while (start < end) {
//        NSString *endStr = [str substringWithRange:NSMakeRange(end, 1)];
//        [resultStr replaceCharactersInRange:NSMakeRange(start, 1) withString:endStr];
//
//        NSString *startStr = [str substringWithRange:NSMakeRange(start, 1)];
//        [resultStr replaceCharactersInRange:NSMakeRange(end, 1) withString:startStr];
//
//        start++;
//        end--;
//    }
//    return resultStr;
//}


@end
