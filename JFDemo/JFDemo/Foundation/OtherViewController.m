//
//  OtherViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/16.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // iOS 开发：Foundation 框架详尽总结之『数字、结构体、日期、文件类』
}

/*
#本文对Foundation框架中一些数字类（NSNumber）、常用结构体类（CGPoint、CGSize、CGRect、CGRange和NSValue）、日期类（NSDate、NSCalendar）和文件类（NSFileManager）的使用做一个详细的总结
*/

-(void)numCreate{
    
    int age = 10;
    double number= 5.1;
    int value =  6;
    // 将基本数据类型转换为对象类型
    NSNumber *ageN = [NSNumber numberWithInt:age];
    NSNumber *numberN = [NSNumber numberWithDouble:number];
    NSNumber *valueN = [NSNumber numberWithInt:value];
    
    
//    NSNumber *ageN = @10;
//    NSNumber *numberN = @5.1;
//    NSNumber *valueN = @6;
//    NSNumber *flag = @YES;
    
//    - (BOOL)isEqualToNumber:(NSNumber *)number;
}

-(void)compare{
    NSNumber *num1 = @20;
    NSNumber *num2 = @10;

    if ([num1 compare:num2] == NSOrderedSame) {     // 相等
        NSLog(@"num1 == num2");
    } else if ([num1 compare:num2] == NSOrderedAscending) { // 小于
        NSLog(@"num1 < num2");
    } else if ([num1 compare:num2] == NSOrderedDescending) { // 大于
        NSLog(@"num1 > num2");
    }

//    输出结果：num1 > num2
}

-(void)struct{
//    结构体类（CGPoint、CGSize、CGRect、CGRange和NSValue）
    
    
    // 方式1
    NSRange range;
    range.location = 7;
    range.length = 3;

    // 方式2
    NSRange range1 = {7, 3};
//    或者
    NSRange range2 = {.location = 7,.length = 3};

    // 方式3 : 使用NSMakeRange函数
    NSRange range3 = NSMakeRange(7, 3);
}

-(void)NSValue{//将结构体转换为对象
//    + (NSValue *)valueWithPoint:(NSPoint)point;
//    + (NSValue *)valueWithSize:(NSSize)size;
//    + (NSValue *)valueWithRect:(NSRect)rect;
//    - (NSPoint)pointValue;
//    - (NSSize)sizeValue;
//    - (NSRect)rectValue;
    
    CGPoint point = CGPointMake(10, 20);

    NSValue *value2 = [NSValue valueWithCGPoint:point];
    NSArray *arr = @[value2];
    NSLog(@"%@", arr);

    
    // 1.利用NSValue包装自定义的结构体
    typedef struct{
        int age;
        char *name;
        double height;
    }Person;
    Person p = {20, "abc", 1.75};

    // valueWithBytes: 接收一个指针, 需要传递需要包装的结构体的变量的地址
    // objCType: 需要传递需要包装的数据类型
    NSValue *value = [NSValue valueWithBytes:&p objCType:@encode(Person)];

    // 2.从NSValue中取出自定义的结构体变量
    Person res;
    [value getValue:&res];
    NSLog(@"age = %i, name = %s, height = %f", res.age, res.name, res.height);

//    输出结果：age = 20, name = abc, height = 1.750000
}

-(void)date{
    NSDate *now = [NSDate date];  // 未偏移量的当前时间
    NSLog(@"now = %@", now);

    // 获取当前所处的时区
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    // 获取当前时区和指定时区的时间差
    NSInteger seconds = [zone secondsFromGMTForDate:now];
    // 得到准确时间
    NSDate *newDate = [now dateByAddingTimeInterval:seconds];
    NSLog(@"newDate = %@", newDate);

//    输出结果：
//    now = 2016-08-07 01:42:44 +0000
//    newDate = 2016-08-07 09:42:44 +0000
}

-(void)formatterDate{
    // 创建时间
    NSDate *now = [NSDate date];
    // 创建时间格式化
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 指定格式
    // yyyy：年
    // MM：月
    // dd：日
    // HH：24小时 hh：12小时
    // mm：分
    // ss：秒
    // Z：时区
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 格式化时间
    NSString *str = [formatter stringFromDate:now];
    NSLog(@"%@", str);

//    输出结果：2016-08-07 09:44:54
    
    
    
    NSString *str1 = @"2015-06-28 19:53:24";
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    formatter2.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [formatter2 dateFromString:str1];
    NSLog(@"%@", date);

//    输出结果：2015-06-28 11:53:24 +0000
}

-(void)NSCalendar{
    NSDate *date = [NSDate date];
    // 创建日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 利用日历对象获取年月日时分秒，将需要获取的类型并入NSCalendarUnit中
    NSCalendarUnit type = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *cmps =[calendar components:type fromDate:date];
    NSLog(@"year = %lu", cmps.year);
    NSLog(@"month = %lu", cmps.month);
    NSLog(@"day = %lu", cmps.day);
    NSLog(@"hour = %lu", cmps.hour);
    NSLog(@"minute = %lu", cmps.minute);
    NSLog(@"second = %lu", cmps.second);
    NSLog(@"date = %@", date);

//    输出结果：
//    year = 2016
//    month = 8
//    day = 7
//    hour = 9
//    minute = 57
//    second = 35
//    date = 2016-08-07 01:57:35 +0000
}

-(void)dateCom{
    // 确定时间
    NSString *time1 = @"2016-06-23 12:18:15";
    NSString *time2 = @"2016-06-28 10:10:10";
    // 将时间转换为date
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date1 = [formatter dateFromString:time1];
    NSDate *date2 = [formatter dateFromString:time2];
    // 创建日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit type = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 利用日历对象比较两个时间的差值
    NSDateComponents *cmps = [calendar components:type fromDate:date1 toDate:date2 options:0];
    // 输出结果
    NSLog(@"两个时间相差%ld年%ld月%ld日%ld小时%ld分钟%ld秒", cmps.year, cmps.month, cmps.day, cmps.hour, cmps.minute, cmps.second);

//    输出结果：两个时间相差0年0月4日21小时51分钟55秒
}

-(void)NSFileManager{
    NSFileManager *manager = [NSFileManager defaultManager];

    // 可以判断文件
    BOOL flag = [manager fileExistsAtPath:@"/Users/Walkers/Desktop/test.txt"];
    NSLog(@"flag = %i", flag);

    // 可以判断文件夹
    flag = [manager fileExistsAtPath:@"/Users/Walkers/Desktop/未命名文件夹"];
    NSLog(@"flag = %i", flag);
    
//    判断path这个文件\文件夹是否存在，isDirectory代表是否为文件夹
    BOOL directory = NO;
    BOOL flag2 = [manager fileExistsAtPath:@"/Users/Walkers/Desktop/未命名文件夹" isDirectory:&directory];
    NSLog(@"flag = %i, directory = %i", flag2, directory);
    
    
//    判断path这个文件\文件夹是否可读
//    - (BOOL)isReadableFileAtPath:(NSString *)path;
//
//    path这个文件\文件夹是否可写
//    - (BOOL)isWritableFileAtPath:(NSString *)path;
//
//    系统目录不允许写入
//    path这个文件\文件夹是否可删除
//    - (BOOL)isDeletableFileAtPath:(NSString *)path;
}

-(void)NSFileManagerFile{
    
//    获得path这个文件\文件夹的属性
    NSFileManager *manager = [NSFileManager defaultManager];
    NSDictionary *dict = [manager attributesOfItemAtPath:@"/Users/Walkers/Desktop/test.txt" error:nil];
    NSLog(@"dit = %@", dict);
    
//    获取 path 当前子路径
    NSArray *paths = [manager contentsOfDirectoryAtPath:@"/Users/Walkers/Desktop/" error:nil];
    NSLog(@"paths = %@", paths);
    
//    获得文件内容- (NSData *)contentsAtPath:(NSString *)path;
    
//    获得path的所有子路径
    
//    - (NSArray *)subpathsAtPath:(NSString *)path;
//    - (NSArray *)subpathsOfDirectoryAtPath:(NSString *)path error:(NSError **)error;
}

-(void)NSFileManagerFileOpera{
    /*
    拷贝- (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error;

    移动(剪切)- (BOOL)moveItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error;

    删除- (BOOL)removeItemAtPath:(NSString *)path error:(NSError **)error;

    创建文件夹(createIntermediates为YES代表自动创建中间的文件夹)
     - (BOOL)createDirectoryAtPath:(NSString *)path withIntermediateDirectories:(BOOL)createIntermediates attributes:(NSDictionary *)attributes error:(NSError **)error;
     
     - (BOOL)createFileAtPath:(NSString *)path contents:(NSData *)data attributes:(NSDictionary *)attr;
*/
    
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL flag = [manager createDirectoryAtPath:@"/Users/Walkers/Desktop/test" withIntermediateDirectories:YES attributes:nil error:nil];
    NSLog(@"flag = %i", flag);
    
    
    NSString *str = @"abc";
    NSData  *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    BOOL flag2 = [manager createFileAtPath:@"/Users/Walkers/Desktop/abc.txt" contents:data attributes:nil];
    NSLog(@"flag = %i", flag2);
}


@end

