//
//  StringViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/14.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "StringViewController.h"

@interface StringViewController ()

@end

@implementation StringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)stringWithContentsOfFile{
    // 用来保存错误信息
    NSError *error = nil;

    // 读取文件内容
    NSString *str = [NSString stringWithContentsOfFile:@"/Users/Walkers/Desktop/test.txt" encoding:NSUTF8StringEncoding error:&error];

    // 如果有错误信息
    if (error) {
        NSLog(@"读取失败, 错误原因是:%@", [error localizedDescription]);
    } else { // 如果没有错误信息
        NSLog(@"读取成功, 文件内容是:\n%@", str);
    }

//    输出结果：读取成功, 文件内容是:abc
}

-(void)writeFile{
    NSString *str = @"abc";

    BOOL flag = [str writeToFile:@"/Users/Walkers/Desktop/test.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (flag == 1)
    {
        NSLog(@"写入成功");
    }

//    输出结果：写入成功
    
//    重复写入同一文件会覆盖掉上一次的内容
//    NSString *str1 = @"abc";
//    BOOL flag = [str1 writeToFile:@"/Users/Walkers/Desktop/test.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
//
//    NSString *str2 = @"xyz";
//    [str2 writeToFile:@"/Users/Walkers/Desktop/test.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
//
//    NSString *str = [NSString stringWithContentsOfFile:@"/Users/Walkers/Desktop/test.txt" encoding:NSUTF8StringEncoding error:&error];
//    NSLog(@"str = %@", str);

//    输出结果: xyz


}

-(void)URL{
    NSURL *url = [NSURL   URLWithString:@"file:///Users/Walkers/Desktop/str.txt"];
    
    NSURL *url2 = [NSURL fileURLWithPath:@"/Users/Walkers/Desktop/str.txt"];
    
    
    NSError *error = nil;
    // 读取文件内容
    NSString *str = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    
//    写入URL中
    NSString *str2 = @"Walkers";
    [str2 writeToURL:[NSURL URLWithString:@"/Users/Walkers/Desktop/str.txt"] atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

-(void)compar{
//    uppercaseString
//    lowercaseString
//    capitalizedString
    
    
    NSString *str1 = @"abc";
    NSString *str2 = @"abd";

    switch ([str1 compare:str2]) {
        case NSOrderedAscending:
            NSLog(@"后面一个字符串大于前面一个");
            break;
        case NSOrderedDescending:
            NSLog(@"后面一个字符串小于前面一个");
            break;
        case NSOrderedSame:
            NSLog(@"两个字符串一样");
            break;
    }

//    输出结果：后面一个字符串大于前面一个
    
//    忽略大小写进行比较
//    (NSComparisonResult) caseInsensitiveCompare:(NSString *)string;
}

-(void)search{
//    hasPrefix
//    hasSuffix
//    rangeOfString
    
    NSString *str = @"http://jianshu.com/img/Walkers.gif";
    NSRange range = [str rangeOfString:@"Walkers"];

    if (range.location == NSNotFound) {
        NSLog(@"str中没有需要查找的字符串");
    } else {
        NSLog(@"str中有需要查找的字符串");
        NSLog(@"location = %lu, length = %lu", range.location, range.length);
    }

//    输出结果：
//    str中有需要查找的字符串
//    location = 23, length = 7

}

-(void)cutAndReplace{
//    substringFromIndex
//    substringToIndex
//    substringWithRange
    
//    stringByReplacingOccurrencesOfString
    
//    去除首尾
//    - (NSString *)stringByTrimmingCharactersInSet:(NSCharacterSet *)set;
    NSString *str =  @"   http://jianshu.com/img/Walkers.gif   ";
    NSString *newStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    NSString *newStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"*"]];
}

-(void)path{
    // 其实就是判断是否以/开头
    //    NSString *str = @"/Users/Walkers/Desktop/test.txt";    // 绝对路径
    NSString *str = @"Users/Walkers/Desktop/test.txt";       // 不是绝对路径
    if ([str isAbsolutePath]) {
        NSLog(@"是绝对路径");
    }else {
        NSLog(@"不是绝对路径");
    }

//    输出结果：不是绝对路径
    
    
//    获得最后一个目录- (NSString *)lastPathComponent; = test.txt
    
//    删除最后一个目录- (NSString *)stringByDeletingLastPathComponent;
    
//    在路径的后面拼接一个目录- (NSString *)stringByAppendingPathComponent:(NSString *)str;
//也可以使用stringByAppendingString:或者stringByAppendingFormat:拼接字符串内容
}

//扩展名
-(void)extension{
    // 其实就是从最后面开始截取.之后的内容
    //    NSString *str = @"test.txt";
    NSString *str = @"abc.test.txt";
    NSString *extension = [str pathExtension];
    NSLog(@"extension = %@", extension);

//    输出结果：extension = txt
    
//    删除尾部的拓展名- (NSString *)stringByDeletingPathExtension;
    
//    在尾部添加一个拓展名- (NSString *)stringByAppendingPathExtension:(NSString *)str;
    
    // 其实就是在最后面拼接上.和指定的内容
    NSString *str1 = @"abc";
    NSString *newStr = [str1 stringByAppendingPathExtension:@"gif"];
    NSLog(@"newStr = %@", newStr);

//    输出结果：newStr = abc.gif
}

-(void)other{
//    返回index位置对应的字符- (unichar)characterAtIndex:(NSUInteger)index;
    
//    UTF8String 字符串转为C语言中的字符串
    NSString *str = @"abc";
    const char *cStr = [str UTF8String];
    NSLog(@"cStr = %s", cStr);
    
    char *cStr1 = "abc";
    NSString *str1 = [NSString stringWithUTF8String:cStr1];
    NSLog(@"str = %@", str1);
    
}

-(void)NSMutableString{
//    appendString
//    appendFormat
//    deleteCharactersInRange
//    insertString
//    replaceCharactersInRange
}

@end
